require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: "Example User", 
      email: "user@example.com", 
      password: "foobarrrrr",           
      password_confirmation: "foobarrrrr"
    )
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
    @user.save
    assert_not copy.valid?
  end

  test "Email should be unique even if is uppercase" do
    copy = @user.dup()
    @user.save
    copy.email.upcase
    assert_not copy.valid?
  end

  test "Email should be saved in lowercase" do
    UPCASE_EMAIL = "TALES.GODIS@GMAIL.COM"
    @user.email = UPCASE_EMAIL
    @user.save
    assert_equal @user.reload.email, UPCASE_EMAIL.downcase
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
