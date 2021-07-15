require "test_helper"

class UserTest < ActiveSupport::TestCase
  test '#name returns the users full name' do
    assert_equal 'John Doe', build(:user, first_name: 'John', last_name: 'Doe').name
  end
end
