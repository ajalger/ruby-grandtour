require 'sinatra'
require 'redis'

# variable stores your Compose Redis connection URL 
compose_redis_url = ENV['COMPOSE_REDIS_URL']

# set up a new Redis client
r = Redis.new(url: compose_redis_url)

# This will allow the index.html file to be loaded
get '/' do 
    File.read(File.join('public', 'index.html'))
end

# The GET route will return the words and their definitions
get '/words' do
    # content is set to application/json
    content_type :json
    r.hgetall('words').map {|key, value| {'word': key, 'definition': value}}.to_json
end

# The PUT route will save a word and its definition
put '/words' do
    # when the 'Add' button is clicked it will create a new document to send to the database
    # params[:] grabs the word and the description from the HTML input boxes
    r.hset('words', params[:word], params[:definition])
    status 200
end

