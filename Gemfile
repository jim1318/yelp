source 'https://rubygems.org'
ruby '2.1.2'

gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'sprockets-rails'
gem 'coffee-rails'
gem 'rails', '4.1.1'
gem 'haml-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'pg'
gem 'turbolinks'

#Jim added
gem 'bootstrap_form'
gem 'bcrypt-ruby'

group :development do
  gem 'thin'
  gem "better_errors"
  gem "binding_of_caller"
end

group :development, :test do
  gem 'pry'
  gem 'pry-nav'
  gem 'rspec-rails'

  #Jim Added
  gem 'fabrication'
  gem 'faker'
end

group :test do
  gem 'database_cleaner', '1.4.1'
  gem 'shoulda-matchers', '2.7.0'
  gem 'vcr', '2.9.3'


  #Jim Added
  gem 'capybara'
  gem 'launchy'

end

group :production do
  gem 'rails_12factor'
end