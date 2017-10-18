require 'sinatra'
require 'mysql2'
require 'uri'

# store your Compose MySQL connection string and certificate path in variables from the environment variables
compose_mysql_url = ENV['COMPOSE_MYSQL_URL']

# tell the 'uri' to parse the Compose MySQL connection string
uri = URI compose_mysql_url

# create a new connection to Compose MySQL.
# the 'uri' library will grab the host, port, user, and password from your Compose MySQL connection string
client = Mysql2::Client.new(
    host: uri.host,
    port: uri.port,
    username: uri.user,
    password: uri.password,
    database: 'example',
    ssl_mode: 'required'
)

# creates a table called 'words' if it doesn't already exist
client.query('
    CREATE TABLE IF NOT EXISTS words (
        id SERIAL NOT NULL PRIMARY KEY,
        word VARCHAR(255) NOT NULL,
        definition VARCHAR(255) NOT NULL
    )'
)

get '/' do 
    # serves the top-level page display
    File.read(File.join('public', 'index.html'))
end

# The GET route will return the words and their definition
get '/words' do
    # content is set to application/json
    content_type :json
    # queries all words in the table and returns it as a JSON document to display on the page 
    client.query('SELECT word, definition FROM words').map {|doc| doc}.to_json
end

# The PUT route will save a word and its definition
put '/words' do
    # when the 'Add' button is clicked it will create a new document to send to the database
    # params[:] grabs the word and the description from the HTML input boxes
    client.query("INSERT INTO words (word, definition) VALUES ('#{params[:word]}', '#{params[:definition]}')")
    status 200
end


