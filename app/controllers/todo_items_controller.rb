class TodoItemsController < ApplicationController
  before_action :set_card
  def create
    @todo_item = TodoItem.new(todo_item_params)
    @card = Card.find(@todo_item.card_id)
    if @todo_item.save
      respond_to do |format|
        format.js {}
      end
    end
  end
  def destroy
    @todo_item = TodoItem.find(params[:id])
    @todo_item.destroy
    render nothing: true
      respond_to do |format|
        format.js {}
      end
  end
  def complete
    @todo_item = TodoItem.find(params[:id])
    if @todo_item.update_attribute(:completed_at, Time.now)
      respond_to do |format|
        format.js {}
      end
    end
  end
  def unmark
    @todo_item = TodoItem.find(params[:id]) 
    if @todo_item.update_attribute(:completed_at, nil) 
      respond_to do |format|
        format.js {}
      end
    end
  end

  private
  def set_card
    @card = Card.find(params[:card_id])
  end
  def todo_item_params
    params[:todo_item].permit(:content, :card_id)
  end
end
