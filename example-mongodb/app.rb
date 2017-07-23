require 'sinatra'
require 'mongo'

# configure the MongoDB database and set the collection 
# to "words" which will hold a word and its description 
configure do 
    client = Mongo::Client.new('mongodb://<username>:<password>@aws-us-west-2-portal.2.dblayer.com:16043,aws-us-west-2-portal.1.dblayer.com:16043/examples?ssl=true', :ssl => true, :ssl_verify => false)
    set :collection, client['words']
end

# This will allow the index.html file to be loaded
get '/' do 
    File.read(File.join('public', 'index.html'))
end

# The GET route will return the words and their description
# from the MongoDB database
get '/words' do
    # content is set to JSON
    content_type :json
    # the database will return all the results as a JSON array
    settings.collection.find().to_a.to_json
end

# The PUT route will save a word and its description into MongoDB
put '/words' do
    # sets up the document that will be saved into MongoDB
    # grabs the word and the description from the HTML input boxes
    doc = {word: params[:word], definition: params[:definition]}
    # it will save one document into the database as a JSON document
    settings.collection.insert_one(doc).to_json
end

