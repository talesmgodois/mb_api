require 'test_helper'

class V1::UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @params_short_pass = {name: "Example User", email: "user@example.com", password: 'test', password_confirmation:'test'}
    @params_right_pass = {name: "Example User", email: "user@example.com", password: '12345678', password_confirmation:'12345678'}
    @user = User.new(name: "Example User", email: "user@example.com")
    @resource = '/v1/users'
  end

  test "Should bring users" do
    get @resource
    assert_response :success
  end

  test "Should not create user" do
    post @resource, params: {user: @params_short_pass}
    assert_response :unprocessable_entity
  end

  test "Should create user" do
    post @resource, params: {user: @params_right_pass}
    assert_response :success
  end
end
