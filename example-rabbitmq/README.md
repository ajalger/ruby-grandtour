## Connecting to RabbitMQ from a Ruby Sinatra App

#### Package Dependencies

* sinatra
* bunny


#### Connection String
The connection string provided by your Compose RabbitMQ deployment should go into an environment variable `COMPOSE_RABBITMQ_URL`.

#### Running the Application
To run the app from the command-line, use the `ruby app.rb` command in the same directory as the ruby file.
