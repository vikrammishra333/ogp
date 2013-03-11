source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'mysql2'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'devise'
gem 'cancan'
gem 'rmagick'
gem 'carrierwave'
gem 'gravatar_image_tag'
gem 'email_verifier'

group :development, :test do
  gem 'database_cleaner'
  #gem 'cucumber-rails'
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '1.4.0'
  gem 'shoulda-matchers'
  gem 'rspec-rails', '2.9.0'
  gem 'rspec-core'
  gem 'guard-rspec', '0.5.5'
  gem 'email_spec'
  gem 'ruby-debug19', :require => 'ruby-debug'
end

gem 'simplecov', :require => false, :group => :test