class CardsController < ApplicationController
  before_action :set_list
  def create
    @card = @list.cards.create(card_params)
    redirect_to @list
  end
  def show
    @card = Card.find(params[:id])
  end
  private
  def set_list
    @list = List.find(params[:list_id])
  end
  def card_params
    params[:card].permit(:description, :user_id, :list_id)
  end
end
