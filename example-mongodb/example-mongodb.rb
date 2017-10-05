require 'sinatra'
require 'mongo'

compose_mongodb_url = ENV['COMPOSE_MONGODB_URL']
compose_mongodb_cert = ENV['PATH_TO_MONGODB_CERT']


# set up a new client using your Compose MongoDB URL and then use the 'words' collection
client = Mongo::Client.new(compose_mongodb_url, ssl: true, ssl_ca_cert: compose_mongodb_cert)
collection = client['words']

# This will allow the index.html file to be loaded
get '/' do 
    File.read(File.join('public', 'index.html'))
end

# The GET route will return the words and their definition
get '/words' do
    # content is set to application/json
    content_type :json
    # the database will return all the results as a JSON array
    collection.find().to_a.to_json
end

# The PUT route will save a word and its definition
put '/words' do
    # when the 'Add' button is clicked it will create a new document to send to the database
    # params[:] grabs the word and the description from the HTML input boxes
    new_word = {word: params[:word], definition: params[:definition]}
    collection.insert_one(new_word)
    status 200
end

