# Simple ruby on rails app to view rsyslog records from postgresql database

## Installation

This application is designed to run in a Docker compose container.

You can install it from repo, called "[rsyslog-rails](https://github.com/sugresmax/rsyslog-rails)".

But you still can run it standalone.

Before start you need to set up postgresql to accept connections from you server
and create databases for rsyslog and application, set up rsyslog to 
save logs into database.

Also you need to set up nginx or other reverse proxy to serve app and static assets.

Copy project to your server `git clone https://github.com/sugresmax/rails_rsyslog && cd rails_rsyslog`

Build it docker `build -t rails_rsyslog .`

Run it
```
docker run -d \
    -v public:/rails/public \
    -e DB_HOST=rsyslog.db.host \
    -e DB_USER=rsyslog.db.host \
    -e DB_PASSWORD=db-password \
    -e RSYSLOG_DB=rsyslog-db-name \
    -e RAILS_DB=rails-db-name \
    -e RAILS_MASTER_KEY=191e2cae935a1bb0e4f518c6fc0c7f0a \
    -e SECRET_KEY_BASE=secret_key_base \
    -p 3000:3000 rails_rsyslog
```
 
After app starting you can connect to it by typing the `server.address:3000` in the browser.
