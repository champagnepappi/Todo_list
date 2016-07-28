require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Musa Omondi", email: "musaomondi@gmail.com")
  end

  test "should be valid" do
    assert @user.valid?
  end
  test "name and email should be present" do
    @user.name = " "
    @user.email= " "
    assert_not @user.valid?
  end
    
end
