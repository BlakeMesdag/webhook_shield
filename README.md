#### Webhook Shield

Basic [Heroku](https://www.heroku.com) addon for forwarding webhooks from [Shopify](https://www.shopify.com/) (or another provider) to the [defunkt/resque](https://github.com/defunkt/resque) or [mperham/sidekiq](https://github.com/mperham/sidekiq) backends.

#### Setup

Change [config/secret_token.rb](https://github.com/BlakeMesdag/webhook_shield/blob/master/config/secret_token.rb) immediately, its a public token and will compromise the signing of your cookies! You'll also need to add a `config/heroku.yml` file with the password and sso_salt from your [addon-manifest](https://devcenter.heroku.com/articles/add-on-manifest), and your [Heroku](https://www.heroku.com) username.

```
bundle install
bundle exec rake db:setup
bundle exec rails server
```

##### Notes

Visiting the application directly will probably 500, you need to visit by going to the [Heroku](https://www.heroku.com) application dashboard.

Deploys are currently configured to go to webhookshield.com, you'll want to change that in [config/deploy/production.rb](https://github.com/BlakeMesdag/webhook_shield/blob/master/config/deploy/production.rb#L17)
