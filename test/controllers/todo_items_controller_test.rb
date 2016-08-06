require 'test_helper'

class TodoItemsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:musa)
    @list = lists(:one)
    @todo_item = todo_items(:one)
  end

  test "should create todo_item" do
    log_in_as(@user)
    get root_path
    #invalid submission
    assert_no_difference 'TodoItem.count' do
      post list_todo_items_path(@list), params: {todo_item: {content: "" }}
    end
    #valid submission
    assert_no_difference 'TodoItem.count', 1 do
      post list_todo_items_path(@list), params: {todo_item: {content: "This is my todo" }}
    end
  end
  # test "should mark todo_item as complete" do
  #   log_in_as(@user)
  #   get list_path(@list)
  #   assert completed?
  # end
end
