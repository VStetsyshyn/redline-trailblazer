source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'pg', '~> 1.2.3'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use Puma as the app server
gem 'puma', '~> 4.1'

# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'grape', '~> 1.4.0'
gem 'jwt', '~> 2.1.0'

gem 'dry-validation', '~> 1.5', '>= 1.5.2'
gem 'grape_fast_jsonapi', '~> 0.2.6'
gem 'reform', '~> 2.3.3'
gem 'reform-rails', '~> 0.2.0'
gem 'rubocop', '~> 0.89.1'
gem 'trailblazer', '~> 2.1'
gem 'trailblazer-rails', '2.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'dotenv-rails', '~> 2.7.6'
  gem 'pry', '~> 0.13.1'
  gem 'rspec', '~> 3.9.0'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'faker', '2.13.0'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
