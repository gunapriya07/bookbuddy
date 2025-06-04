require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

 test "should create user" do
  assert_difference("User.count") do
    post users_url, params: {
      user: {
        name: "Test User",
        email: "unique_user@example.com",  # Must be unique
        password_digest: "securepassword123"
      }
    }
  end

  assert_redirected_to user_url(User.last)
end


  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

test "should update user" do
  patch user_url(@user), params: {
    user: {
      name: "Updated Name",
      email: "updated_email@example.com",  # Make sure it's different if your test db enforces uniqueness
      password_digest: "newsecurepassword"
    }
  }

  assert_redirected_to user_url(@user)
  @user.reload
  assert_equal "Updated Name", @user.name
end


  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
