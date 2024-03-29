source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5', group: :development
gem 'pg', group: :production

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
gem 'bootstrap', '~> 5.2.3'
gem 'font-awesome-sass', '~> 5.12.0'
gem 'jquery-rails'
gem 'sass-rails'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Authentication
gem 'carrierwave'
gem 'mini_magick'
gem 'ransack', '~> 3.2.1'

# sorcery for authentication
gem 'sorcery'

gem 'enum_help'

# translation
gem 'rails-i18n'

# ogp
gem 'meta-tags'

# TMDb API
gem 'themoviedb-api', '~> 1.4', '>= 1.4.1'

# 環境変数
gem 'dotenv-rails'

# AWS
gem 'aws-sdk-s3', require: false
gem 'fog-aws'

#ページネーション
gem 'kaminari'

# カレンダー
gem 'simple_calendar'

gem 'delayed_job_active_record'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  # Test
  gem 'factory_bot_rails'
  gem 'rspec-rails'

  # Code analyze
  gem 'bullet'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false

  # Debugger
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'annotate'
  gem 'solargraph'
  gem 'web-console'

  # パスワードリセット
  gem 'letter_opener_web'
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  gem 'capybara'
  gem 'faker'
  gem 'webdrivers'
end
