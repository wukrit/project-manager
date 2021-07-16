require "test_helper"

class MembershipTest < ActiveSupport::TestCase
  test '#new should initialize the class' do
    assert_kind_of Membership, Membership.new
  end
end
