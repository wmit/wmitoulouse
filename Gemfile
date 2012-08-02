source 'https://rubygems.org'
gem 'rails', '3.2.7'
group :production do
  gem 'pg'
end
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bourbon'
  # Add these gems
  gem 'compass-rails', '~> 1.0.3'
  gem 'zurb-foundation', '~> 3.0.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'slim'
gem 'slim-rails'
group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl'
  gem 'forgery'
  gem 'heroku'
  gem 'sqlite3'
end
group :test do
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'guard-bundler'
  gem "guard-livereload"
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'capybara-webkit'
  gem 'simplecov'
end

group :test, :darwin do
  gem 'rb-fsevent'
  gem 'growl'
end
