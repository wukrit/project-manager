require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    sign_in @user
  end

  test '#index' do
    get projects_path
    assert_response :success
  end

  test '#new' do
    get new_project_path
    assert_response :success
  end

  test '#show' do
    project = create :project
    create(:membership, user: @user, project: project)

    get project_path project

    assert_response :success
  end

  test '#create when proper params provided creates a new project' do
    project_params = { project: { title: 'Test', description: 'Project' } }
    post projects_path, params: project_params

    assert_response :redirect
    assert_equal 1, Project.count
    assert_equal 1, @user.memberships.count
  end

  test '#create when invalid params provided does not create a new project' do
    project_params = { project: { description: 'Project' } }
    post projects_path, params: project_params

    assert_response :success
    assert_equal 0, Project.count
  end

  test '#destroy when authorized destroys the project' do
    project = create :project
    create :membership, user: @user, project: project

    delete project_path project

    assert_response :redirect
    assert_equal 0, Project.count
    assert_equal 0, @user.memberships.count
  end

  test '#destroy when unauthorized does not destroy the project' do
    project = create :project

    delete project_path project

    assert_response :redirect
    assert_equal 1, Project.count
    assert_equal 0, @user.memberships.count
  end
end
