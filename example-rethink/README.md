## Connecting to RethinkDB from a Ruby Sinatra App

#### Package Dependencies
* sinatra
* rethinkdb
* uri

#### Connection String and Certificate
The connection string provided by your Compose RethinkDB deployment should go into an environment variable `COMPOSE_RETHINKDB_URL`.
Save a copy of the certificate and put it's path in an environment variable `PATH_TO_RETHINKDB_CERT`.

#### Running the Application
To run the app from the command-line, `ruby example-rethinkdb.rb` command in the same directory as the ruby file.

The application will be served on 127.0.0.1:4567 and can be opened in a browser.