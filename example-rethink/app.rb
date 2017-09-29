require 'sinatra'
require 'rethinkdb'
require 'uri'
include RethinkDB::Shortcuts

# store your Compose RethinkDB connection string and certificate path from the environment variables
compose_rethinkdb_url = ENV['COMPOSE_RETHINKDB_URL']
path_to_rethink_cert = ENV['PATH_TO_RETHINK_CERT']

# tell the 'uri' to parse the Compose RethinkDB connection string
uri = URI compose_rethinkdb_url

# create a new connection to Compose RethinkDB.
# the 'uri' library will grab the host, port, user, and password from your Compose RethinkDB connection string
conn = r.connect(
    host: uri.host,
    port: uri.port,
    user: uri.user,
    password: uri.password,
    ssl: {
        ca_certs: path_to_rethink_cert
    }
).repl

# create the database 'grand_tour' and the 'words' table if they haven't been created already
begin 
    r.db_create('grand_tour').run(conn)
rescue RethinkDB::RqlRuntimeError
    puts 'Database already exists'
end

begin
    conn.use('grand_tour')
    r.table_create('words', {shards: 1, replicas:3}).run(conn)
rescue  RethinkDB::RqlRuntimeError
    puts 'Table already exists'
end

# This will allow the index.html file to be loaded
get '/' do 
    File.read(File.join('public', 'index.html'))
end

# The GET route will return the words and their description
get '/words' do
    # sets the content type to application/json
    content_type :json
    r.table('words').pluck('word', 'definition').run(conn).to_a.to_json
end

# The PUT route will save a word and its description
put '/words' do
    # when the 'Add' button is clicked it will create a new document to send to the database
    # params[:] grabs the word and the description from the HTML input boxes
    new_word = {word: params[:word], definition: params[:definition]}
    r.table('words').insert(new_word).run(conn)
end

