# features/support/env.rb
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../../config/environment', __FILE__)
abort("O ambiente está em produção!") if Rails.env.production?
require 'cucumber/rails'

module MyWorld
  include Rack::Test::Methods
  include FactoryBot::Syntax::Methods

  def app
    Rails.application
  end
end

World(MyWorld)

require 'database_cleaner/active_record'
DatabaseCleaner.strategy = :transaction

Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end
