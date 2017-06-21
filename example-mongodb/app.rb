require 'sinatra'
require 'mongo'

configure do 
    client = Mongo::Client.new('mongodb://ajalger:mypass@aws-us-west-2-portal.2.dblayer.com:16043,aws-us-west-2-portal.1.dblayer.com:16043/examples?ssl=true', :ssl => true, :ssl_verify => false)
    set :collection, client['words']
end

get '/' do 
    File.read(File.join('public', 'index.html'))
end

get '/words' do
    content_type :json
    settings.collection.find().to_a.to_json
end

put '/words' do
    doc = {word: params[:word], definition: params[:definition]}
    settings.collection.insert_one(doc).to_json
end

