require 'sinatra'
require 'pg'

configure do 
   conn = PG.connect('postgres://admin:mypass@aws-us-west-2-portal.2.dblayer.com:16143/compose')
   p conn.host()
end

get '/' do 
    File.read(File.join('public', 'index.html'))
end

get '/words' do
  content_type :json

end

put '/words' do
    
end

