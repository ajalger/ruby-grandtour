## Connecting to Etcd3 from a Ruby Sinatra App

#### Package Dependencies

* sinatra
* etcdv3


#### Connection String
The connection string provided by your Compose Etcd3 deployment should go into an environment variable `COMPOSE_ETCD_URL`. The username and password should also go into separate environment variables `COMPOSE_ETCD_USERNAME` and `COMPOSE_ETCD_PASSWORD`.

#### Running the Application
To run the app from the command-line, use the `ruby example-etcd.rb` command in the same directory as the ruby file.

The application will be served on 127.0.0.1:4567 and can be opened in a browser.
