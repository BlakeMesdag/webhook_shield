source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use sqlite3 as the database for Active Record
gem 'mysql2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'kensa', group: [:development, :test]

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
gem 'puma'

# Use debugger
ruby_version_major, ruby_version_minor, ruby_version_build = RUBY_VERSION.split(".").map(&:to_i)
if ruby_version_major >= 2
  gem 'byebug', group: [:development, :test]
else
  gem 'debugger', group: [:development, :test]
end

gem 'newrelic_rpm'

gem 'omniauth'
gem 'omniauth-heroku-sso'

gem 'redis'

gem 'twitter-bootstrap-rails'

gem 'capistrano', '~> 3.0.1'

gem 'sidekiq'
gem 'redis-namespace'

gem 'mocha', require: false, group: [:test]
