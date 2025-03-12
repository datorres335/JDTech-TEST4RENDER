source "https://rubygems.org"

gem "rails", "~> 8.0.2" # Rails framework

# Database
gem "pg" # PostgreSQL adapter for Active Record
gem 'dotenv-rails', groups: [:development, :test] # Environment variables

# Web Server
gem "puma", ">= 5.0" # Puma web server

# JavaScript with ESM import maps
gem "importmap-rails"
gem "turbo-rails" # SPA-like features with Turbo
gem "stimulus-rails" # Stimulus framework

# JSON APIs
gem "jbuilder"

# Tailwind CSS integration
group :development do
  gem "tailwindcss-rails", "~> 4.2"
end

# Asset pipeline support
gem "sprockets-rails", "~> 3.4"

# Authentication
gem "devise", "~> 4.9"

# Time zone data for Windows
gem "tzinfo-data", platforms: %i[windows jruby]

# Improves startup time
gem "bootsnap", require: false

# XML parsing
gem "rexml", "3.4.1"

# Development and Testing tools
group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude" # Debugging
  gem "brakeman", require: false # Security analysis
  gem "rubocop-rails-omakase", require: false # Ruby code style
end

group :development do
  gem "web-console" # Debugging via console
end

group :test do
  gem "capybara" # System testing
  gem "selenium-webdriver" # Browser automation
end

gem "aws-sdk-s3", "~> 1.182", require: false
gem "google-cloud-storage"
