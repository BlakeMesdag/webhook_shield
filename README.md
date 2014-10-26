#### Webhook Shield

Basic Heroku addon for forwarding webhooks from Shopify (or another provider) to the defunkt/resque or mperham/sidekiq backends.

#### Setup

Change `config/secret_token.rb` immediately, its a public token and will compromise the signing of your cookies! You'll also need to add a `config/heroku.yml` file with your username, password and sso_salt for Heroku.

```
bundle install
bundle exec rake db:setup
bundle exec rails server
```

##### Notes

Visiting the application directly will probably 500, you need to visit by going to the Heroku application dashboard.

