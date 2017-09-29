## Connecting to PostgreSQL from a Ruby Sinatra App

#### Package Dependencies
* sinatra
* pg
* uri

#### Connection String
The connection string provided by your Compose PostgreSQL deployment should go into an environment variable `COMPOSE_POSTGRESQL_URL`.
Download a copy of the certificate and put it's path in an environment variable `PATH_TO_POSTGRESQL_CERT`.

#### Running the Application
To run the app from the command-line, use the `ruby app.rb` command in the same directory as the ruby file.