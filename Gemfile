source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Devise is a flexible authentication solution for Rails based on Warden.
gem 'devise', '~> 4.3.0'

# This gem provides a simple and extremely flexible way to upload files.
gem 'carrierwave', '~> 1.1.0'

# Module for the 'fog' gem to support Amazon Web Services.
gem 'fog-aws', '~> 1.4.0'

# Rails jQuery file uploads via standard Rails "remote: true" forms.
gem 'remotipart', '~> 1.3.1'

# Mini replacement for RMagick
gem 'mini_magick', '4.5.1'

# It's a small library to provide the I18n translations on the Javascript.
gem 'i18n-js', '~> 3.0.1'

# A gem to automate using jQuery with Rails.
gem 'jquery-rails', '~> 4.3.1'

# Manage Procfile-based applications.
gem 'foreman', '~> 0.63.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background.
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers',
    git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'simplecov', '~> 0.14.1', require: false
  gem 'rails-controller-testing', '~> 1.0.2'
  gem 'rspec-html-matchers', '~> 0.9.1'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'faker', '~> 1.8.4'
  gem 'factory_girl_rails', '~> 4.8.0'
  gem 'dotenv-rails', '2.2.1'
  gem 'regexp-examples', '~> 1.3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
