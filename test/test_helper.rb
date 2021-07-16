require 'simplecov'
SimpleCov.start 'rails' do
  add_filter 'app/channels'
  add_filter 'app/helpers'
  add_filter 'app/jobs'
  add_filter 'app/mailers'

  if ENV['CODECOV_TOKEN']
    require 'codecov'
    formatter SimpleCov::Formatter::Codecov
  end
end

ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
  include FactoryBot::Syntax::Methods
end
