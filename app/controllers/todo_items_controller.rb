class TodoItemsController < ApplicationController
  before_action :set_list
  def create
    @todo_item = @list.todo_items.create(todo_item_params)
    redirect_to @list
  end
  def destroy
    @todo_item = @list.todo_items.find(params[:id])
    @todo_item.destroy
    redirect_to @list
  end
  def complete
    @todo_item = @list.todo_items.find(params[:id])
    @todo_item.update_attribute(:completed_at, Time.now)
    redirect_to @list
    flash[:notice] = "Item completed"
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end
  def todo_item_params
    params[:todo_item].permit(:content, :user_id, :list_id)
  end
end
