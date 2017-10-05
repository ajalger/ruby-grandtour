require 'sinatra'
require 'elasticsearch'

# uses both Compose Elasticsearch URLs by combining them as a single connection string separated by a ','
compose_elasticsearch_urls = ENV['COMPOSE_ELASTICSEARCH_URL']

# Create a new Elasticsearch client using the Compose Elasticsearch URLs, set logs to true, and verify that it's connected using SSL
client = Elasticsearch::Client.new(urls: compose_elasticsearch_urls, transport_options: {ssl: {verify: true}})

# Check if the index 'words' has been created. If not, then create it.
if not client.indices.exists? index: 'words'
    client.indices.create index: 'words'
end

# This will allow the index.html file to be loaded
get '/' do
    File.read(File.join('public', 'index.html'))
end

# The GET route will return the words and their definitions
get '/words' do
    # set content to application/json
    content_type :json
    # get all the words and their definitions from the index
    response = client.search index: 'words', type: 'word'
    # the database will return all the results as a JSON array
    response['hits']['hits'].map {|doc| doc['_source']}.to_json
end

# The PUT route will save a word and its definition 
put '/words' do
    # when the 'Add' button is clicked it will create a new document to send to the database
    # params[:] grabs the word and the description from the HTML input boxes
    new_word = {word: params[:word], definition: params[:definition]}
    client.index index: 'words', type: 'word', body: new_word, refresh: true
    status 200
end

