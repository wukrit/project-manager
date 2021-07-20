require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    sign_in(create(:user))

    get projects_path
    assert_response :success
  end
end
