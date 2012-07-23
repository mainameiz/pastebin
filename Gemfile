source 'http://rubygems.org'

gem 'rails', '~> 3.1.3'
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mongoid'
gem 'bson_ext'
gem 'rubypython'
gem 'pygments.rb'
gem 'haml'
gem 'devise'
gem 'devise-i18n'
gem 'cancan'
gem 'unicorn'
gem 'capistrano'
gem 'jquery-rails'
gem 'therubyracer'
gem 'rails-i18n'
gem 'simplecov'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  # gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'rspec-rails', :group => [ :test, :development ]

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'spork'

  # Only for Linux
  gem 'libnotify'
  gem 'rb-inotify'

  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'guard-spork'

  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
end

group :development do
  gem 'ruby-prof'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
