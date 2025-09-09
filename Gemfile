source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.4'

gem 'rails', '~> 7.0'
gem 'pg'
gem 'puma', '~> 6'
gem "sassc-embedded"
gem "sprockets-rails"
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "turbo-rails" # Replaces Turbolinks
gem 'jbuilder'
gem 'rollbar'
gem 'image_processing'
gem 'aws-sdk-s3'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw] # Modern replacement for byebug
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'rack-mini-profiler'
  gem 'solargraph'
  gem 'spring'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'wdm', '>= 0.1.0' if Gem.win_platform?

gem 'devise'
gem 'trestle'
gem 'trestle-auth'
gem 'bcrypt_pbkdf'
gem 'capistrano'
gem 'capistrano-passenger'
gem 'capistrano-rails'
gem 'capistrano-rbenv'
gem 'ed25519'
gem 'cancancan'
gem 'pry'
gem 'pagy'
gem 'friendly_id'
gem 'meta-tags'
gem 'recaptcha'
