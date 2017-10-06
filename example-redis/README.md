## Connecting to Redis from a Ruby Sinatra App

#### Package Dependencies

* sinatra
* redis


#### Connection String
The connection string provided by your Compose Redis deployment should go into an environment variable `COMPOSE_REDIS_URL`. If you are connecting to Redis with SSL, save a copy of the certificate and put it's path in an environment variable `PATH_TO_REDIS_CERT`.

#### Running the Application
To run the app from the command-line, use the `ruby example-redis.rb` command in the same directory as the ruby file. Or, if you select the Redis version that uses a TLS connection, use the `ruby example-redis-ssl.rb` command in the same directory.

The application will be served on 127.0.0.1:4567 and can be opened in a browser.
