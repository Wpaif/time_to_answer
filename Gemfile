source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.9'

gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.0'
gem 'sass-rails', '~> 5.0'
gem 'sqlite3'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
# gem 'turbolinks', '~> 5'

gem 'bootsnap', '>= 1.1.0', require: false

gem 'devise'
gem 'faker'
gem 'kaminari'
gem 'kaminari-i18n'
gem 'rails-i18n', '~> 5.1'
gem 'tty-spinner'

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'

  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'

  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
