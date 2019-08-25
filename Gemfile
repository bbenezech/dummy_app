# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.7.2'

gem 'rails', '6.0.3.4'

gem 'bootsnap', '~> 1.4', require: false
gem 'puma', '~> 5.0'

gem 'webpacker', '~> 5.2'

gem 'cancancan', '~> 3.1'
gem 'carrierwave', '~> 2.1'
gem 'devise', '~> 4.7'
gem 'dragonfly', '~> 1.2'
gem 'kt-paperclip', '~> 6.3'
gem 'mini_magick', '~> 4.10'
gem 'mlb', '~> 0.7.0'
gem 'paper_trail', '~> 11.0'
gem 'paper_trail-association_tracking', '~> 2.1'
gem 'rails_admin', github: 'sferik/rails_admin'

gem 'sassc-rails', '~> 2.1'
gem 'uglifier', '~> 4.2'

group :development, :test do
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'rubocop', '~> 1.0', require: false
  gem 'rubocop-performance', '~> 1.8', require: false
  gem 'rubocop-rails', '~> 2.8', require: false
  gem 'spring', '~> 2.1'
  gem 'spring-watcher-listen', '~> 2.0'
  gem 'web-console', '~> 4.0'
end

group :production do
  gem 'pg', '~> 1.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
