source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4'

gem 'faker'
gem 'redis'
gem 'redis-namespace'
gem 'redis-rails'

gem 'sidekiq'
gem 'sidekiq-cron', '~> 1.1'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rubocop', require: false
  gem 'timecop', '~> 0.9.4'
end

group :development do
  gem 'listen', '~> 3.3'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
