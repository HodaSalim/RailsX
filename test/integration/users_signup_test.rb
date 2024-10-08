require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test("Invalid signup form input") do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: { user: { name: "", email: "user@invalid", password: "foo", password_confirmation: "bar" } }
    end
    assert_response :unprocessable_entity
    assert_template "users/new"
  end

  test("Valid signup input") do
    get signup_path
    assert_difference "User.count", 1 do
      post users_path, params: { user: { name: "test", email: "user@valid.com", password: "foobarr", password_confirmation: "foobarr" } }
    end

    follow_redirect!
    assert_template "users/show"
    assert is_logged_in?
  end
end
