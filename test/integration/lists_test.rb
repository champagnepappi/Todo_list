require 'test_helper'

class ListsTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:musa)

  end
  test "list interface" do
    log_in_as(@user)
    get root_path
    #invalid submission
    assert_no_difference 'List.count' do
      post lists_path, params: {list: {title:"", description: "this is all about project"}}
    end
    #valid submission
    title="Todo App"
    description= "This is about this app"
    assert_difference 'List.count', 1 do
      post lists_path, params: {list: {title: title, description: description}}
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_select 'a', text: 'delete'
    first_list = @user.lists.first
    assert_difference 'List.count', -1 do
      delete list_path(first_list)
    end
    #Visit a different user.
    get user_path(users(:benard))
    assert_select 'a', text: 'delete', count: 0
  end
end
