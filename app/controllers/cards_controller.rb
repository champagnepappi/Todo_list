class CardsController < ApplicationController
  def index
    @cards = Card.all
  end
  def create
    # debugger
    @card = Card.new(card_params)
    if @card.save
      respond_to do |format|
        format.js {}
      end
    else
      #render error
    redirect_to @card
    end
  end
  def show
    @card = Card.find(params[:id])
  end
  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to list_path
    flash[:notice] = 'Card was successfully destroyed.'
  end
  private
  def card_params
    params[:card].permit(:description, :list_id)
  end
end
