# The Grand Tour - Ruby
A set of example applications that will add word/definition pairs to a database running on Compose.

This repo contains the apps written in Ruby 2.4.1 and uses Sinatra 2.

## Running the Example
To run from the command-line:
  * navigate to the example-<_db_> directory 
  * check if you need to only export your Compose connection string as an environment variable, and/or any  certificate, username, or password as separate environment variables
  * and then: `ruby example-<_db_>.rb`

The application will be served on 127.0.0.1:4567 and can be opened in a browser.
