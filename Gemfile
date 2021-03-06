source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'chosen-rails'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'rails-i18n', '~> 5.0.0'

# gem for postgresql

gem 'will_paginate', '>= 3.1'
gem 'pg'

gem 'bootstrap-sass', '~> 3.3.1'
gem 'font-awesome-rails'
gem 'will_paginate-bootstrap'
gem 'tinymce-rails'
# Gentella  bootstrap template for admins
gem 'gentelella-rails'
# For authentication
gem 'devise'
gem "devise_ldap_authenticatable"
gem "net-ldap"
# Files
gem 'carrierwave', '~> 1.0'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'sysrandom'

gem 'to_words'

gem "rails-erd"

gem 'http_accept_language'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
gem 'faker'
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'capybara'
  gem 'factory_girl_rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'bcrypt', platforms: :ruby

gem 'prawn'
