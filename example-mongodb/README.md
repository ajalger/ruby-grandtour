## Connecting to MongoDB from a Ruby Sinatra App

#### Package Dependencies
* sinatra
* mongo

#### Connection String
The connection string provided by your Compose MongoDB deployment should go into an environment variable `COMPOSE_MONGODB_URL`. Download a copy of the certificate and put it's path in an environment variable `PATH_TO_MONGODB_CERT`.

#### Running the Application
To run the app from the command-line, use the `ruby app.rb` command in the same directory as the ruby file.
