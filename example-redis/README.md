## Connecting to Redis from a Ruby Sinatra App

#### Package Dependencies

* sinatra
* redis


#### Connection String
The connection string provided by your Compose Redis deployment should go into an environment variable `COMPOSE_REDIS_URL`.

#### Running the Application
To run the app from the command-line, use the `ruby app.rb` command in the same directory as the ruby file.

