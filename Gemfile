source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4'
gem 'active_model_serializers', '~> 0.10.0'

gem 'redis'
gem 'redis-namespace'
gem 'redis-rails'

gem 'sidekiq'
gem 'sidekiq-cron', '~> 1.1'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'faker'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'timecop', '~> 0.9.4'
  gem 'rubocop', require: false
end

group :development do
  gem 'listen', '~> 3.3'
  # gem 'sqlite3'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
