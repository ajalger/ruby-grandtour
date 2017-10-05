require 'sinatra'
require 'etcdv3'

# Compose Etcd connection string URLs and username and password as separate environment variables 
compose_etcd_urls = ENV['COMPOSE_ETCD_URL']
compose_etcd_user = ENV['COMPOSE_ETCD_USER']
compose_etcd_password = ENV['COMPOSE_ETCD_PASSWORD']

# connect to etcd using the environment variables
conn = Etcdv3.new(endpoints: compose_etcd_urls, user: compose_etcd_user, password: compose_etcd_password)

# This will allow the index.html file to be loaded
get '/' do
    File.read(File.join('public', 'index.html'))
end

# The GET route will return the words and their definitions
get '/words' do
    # set content to application/json
    content_type :json
    # get all the words starting with '/' and return those as a JSON array
    conn.get('/', range_end: '\0').kvs.map {|w| {word: w.key, definition: w.value}}.to_a.to_json
end

# The PUT route will save a word and its definition 
put '/words' do
    # save words in Etcd using the '/word' as a key and 'definition' as the value
    conn.put("/#{params[:word]}", params[:definition])
end

