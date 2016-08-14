require 'test_helper'

class ListsTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:musa)
    @list=lists(:one)
  end
  test "list interface" do
    log_in_as(@user)
    get root_path
    #invalid submission
    assert_no_difference 'List.count' do
      post lists_path, params: {list: {title:""}}
    end
    #valid submission
    title="Todo App"
    assert_difference 'List.count', 1 do
      post lists_path, params: {list: {title: title}}
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
  test "should show list" do
    log_in_as(@user)
    get list_url(@list)
    assert_response :success
  end
  test "should edit list" do
    log_in_as(@user)
    get edit_list_path(@list)
    assert_response :success
  end
  test "should update list" do
    log_in_as(@user)
    patch list_url(@list), params: { list: { title: @list.title } }
    assert_redirected_to list_path(@list)
  end
end
