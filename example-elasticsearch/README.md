## Connecting to Elasticsearch from a Ruby Sinatra App

#### Package Dependencies
* sinatra
* elasticsearch

#### Connection String
The connection string provided by your Compose Elastcisearch deployment should go into an environment variable `COMPOSE_ELASTICSEARCH_URL`.

#### Running the Application
To run the app from the command-line, use the `ruby app.rb` command in the same directory as the ruby file.

The application will be served on 127.0.0.1:4567 and can be opened in a browser.