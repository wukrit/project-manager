require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  test '#new should initialize the class' do
    assert_kind_of Project, Project.new
  end
end
