require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(
      name: "Test User",
      email: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  test "should get login form" do
    get login_url
    assert_response :success
  end

  test "should log in with valid credentials" do
    post login_url, params: { email: @user.email, password: "password" }
    assert_redirected_to root_url
    assert_equal @user.id, session[:user_id]
  end

  test "should not log in with invalid credentials" do
    post login_url, params: { email: @user.email, password: "wrong" }
    assert_response :success
    assert_nil session[:user_id]
    assert_select "div.alert", /Invalid email or password/
  end

  test "should log out successfully" do
    post login_url, params: { email: @user.email, password: "password" }
    delete logout_url
    assert_redirected_to login_url
    assert_nil session[:user_id]
  end
end
