require 'test_helper'

class V1::UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end
end
