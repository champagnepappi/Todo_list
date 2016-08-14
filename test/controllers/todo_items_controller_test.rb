require 'test_helper'

class TodoItemsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:musa)
    @card = cards(:one)
    @todo_item = todo_items(:one)
  end

  test "should create todo_item" do
    log_in_as(@user)
    get root_path
    #invalid submission
    assert_no_difference 'TodoItem.count' do
      post card_todo_items_path(@card), params: {todo_item: {content: "" }}
    end
    #valid submission
    assert_no_difference 'TodoItem.count', 1 do
      post card_todo_items_path(@card), params: {todo_item: {content: "This is my todo" }}
    end

  end
end
