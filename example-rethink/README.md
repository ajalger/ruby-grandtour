## Connecting to RethinkDB from a Ruby Sinatra App

#### Package Dependencies
* sinatra
* rethinkdb
* uri

#### Connection String and Certificate
The connection string provided by your Compose RethinkDB deployment should go into an environment variable `COMPOSE_RETHINKDB_URL`.
Download a copy of the certificate and put it's path in an environment variable `PATH_TO_RETHINKDB_CERT`.

#### Running the Application
To run the app from the command-line, `ruby app.rb` command in the same directory as the ruby file.