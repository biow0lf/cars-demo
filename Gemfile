# frozen_string_literal: true

source "https://rubygems.org"

ruby File.read(".ruby-version")

gem "rails", "7.0.4.2"
gem "sprockets-rails"
gem "pg"
gem "puma"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 5.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

gem "pry-rails"
gem "kaminari"
gem "dartsass-rails"
gem "bootstrap"
gem "progress_bar", require: false

group :development, :test do
  gem "rspec-rails", ">= 6.0.1"
  gem "factory_bot_rails"
  gem "faker"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "standard", "1.22.1", require: false
  gem "fasterer", require: false
  gem "brakeman", require: false
end

group :development do
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"
end

group :test do
  gem "simplecov", require: false
  gem "database_rewinder"
  gem "rails-controller-testing"
  gem "shoulda-matchers"
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
end
