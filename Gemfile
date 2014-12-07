if RUBY_VERSION =~ /1.9/
	Encoding.default_external = Encoding::UTF_8
	Encoding.default_internal = Encoding::UTF_8
end
source 'https://rubygems.org'

ruby "1.9.3"
gem 'paperclip'
gem 'aws-sdk'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0.rc1'
# Use sqlite3 as the database for Active Record
gem 'globalize', '~> 4.0.2'
gem 'globalize-accessors'
gem "i18n-js"
gem "font-awesome-rails"
#gem 'spree', :github => 'radar/spree', :branch => '2-1-stable'
gem 'pg'
gem 'bxslider-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.0.beta1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'mandrill-api'
gem 'mandrill_mailer'
# Use jQuery as the JavaScript library
gem 'jquery-rails', '~> 4.0.0.beta2'
gem 'jquery-ui-rails'
gem 'jquery-turbolinks'
group :development do
	gem 'better_errors','0.0.8'
	gem "binding_of_caller"
end
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'

# Use Unicorn as the app server
# gem 'unicorn'
gem 'rails_12factor', group: :production
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'debugger' anywhere in the code to stop execution and get a debugger console
  gem 'debugger'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0.0.beta4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
