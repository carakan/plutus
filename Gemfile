source 'http://rubygems.org'

# Specify your gem's dependencies in plutus.gemspec
gemspec

group :development, :test do
  gem 'activerecord-jdbcsqlite3-adapter', require: 'jdbc-sqlite3', platform: :jruby
  gem 'coveralls', require: false
  gem 'factory_girl_rails', '~> 1.1'
  gem 'jdbc-sqlite3', platform: :jruby
  gem 'rails-controller-testing'
  gem 'rspec', '~> 3'
  gem 'rspec-its'
  gem 'rspec-rails', '~> 3'
  gem 'sqlite3', platform: %i[ruby mswin mingw]
end
