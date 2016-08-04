require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:musa)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params:{user: { name: "",
                                            email: "foo@invalid",
                                            password: "foo",
                                            password_confirmation: "bar" }}
    assert_template 'users/edit'
  end
  test "successful edit with friendly forwarding" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Musa Omondi"
    email = "musa@omondi.com"
    patch user_path(@user), params:{user: { name: name,
                                            email: email,
                                            password: "foobar",
                                            password_confirmation: "foobar" }}
    assert_not flash.empty?
    # follow_redirect!
    assert_redirected_to @user
    @user.reload
    assert_equal @user.name, name
  end
end
