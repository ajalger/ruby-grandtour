require 'sinatra'
require 'bunny'

# variable stores your Compose RabbitMQ connection URLs
compose_rabbitmq_url = ENV['COMPOSE_RABBITMQ_URL']

# set up a new RabbitMQ connection
begin
    conn = Bunny.new(compose_rabbitmq_url)
    conn.start
rescue Bunny::TCPConnectionFailed
    puts "Connection to #{conn.hostname} failed"
end

exchange_name = 'grand_tour'
routing_key = 'words'
q_name = 'sample'

channel = conn.create_channel
exchange = channel.direct(exchange_name)    
queue = channel.queue(q_name, :durable => true, :exclusive => false).bind(exchange, :key => routing_key)

get '/' do 
    File.read(File.join('public', 'index.html'))
end

get '/message' do
    content_type :json
    delivery_info, properties, payload = queue.pop
    payload.nil? ? nil.to_json : payload.to_json
end

put '/message' do
    message = params[:message]
    queue.publish(message, :content_type => "text/plain", :key => routing_key)
    message.to_s
end

