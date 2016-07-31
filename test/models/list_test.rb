require 'test_helper'

class ListTest < ActiveSupport::TestCase
  def setup
    @user = users(:musa)
    @list = List.new(title: "Home", description: "Lorem ipsum", user_id: @user.id)
  end
  test "should be valid" do
    assert @list.valid?
  end
  test "user id should be present" do
    @list.user_id = nil
    assert_not @list.valid?
  end
end
