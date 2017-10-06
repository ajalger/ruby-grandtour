## Connecting to MongoDB from a Ruby Sinatra App

#### Package Dependencies
* sinatra
* mongo

#### Connection String
The connection string provided by your Compose MongoDB deployment should go into an environment variable `COMPOSE_MONGODB_URL`. Copy and paste the certificate in a file and put it's path in an environment variable `PATH_TO_MONGODB_CERT`.

#### Running the Application
To run the app from the command-line, use the `ruby example-mongodb.rb` command in the same directory as the ruby file.

The application will be served on 127.0.0.1:4567 and can be opened in a browser.
