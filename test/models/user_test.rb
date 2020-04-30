require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
	end
	
	test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "name should not be bigger than 50" do
    @user.name = "a"* 51
    assert_not @user.valid?
  end

  test "email should not be bigger than 255" do
    @user.email = "a"* 256
    assert_not @user.valid?
  end

  test "email formatted should be valid" do
    @user.email = "x@x.com"
    assert @user.valid?
  end

  test "Email should be unique" do
    copy = @user.dup()
    assert_not copy.valid?
  end

  test "Email should be unique even if is uppercase" do
    copy = @user.dup()
    copy.email.upcase
    assert_not copy.valid?
  end
end
