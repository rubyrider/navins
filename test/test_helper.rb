require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/reporters'
require 'database_cleaner'
Minitest::Reporters.use!
DatabaseCleaner.strategy = :transaction

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end

# Operation test class
class OperationTestCase < Minitest::Spec
  include ActiveSupport::Testing::Assertions

  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end