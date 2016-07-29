class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end
  def show
  end
  def new
    @list = List.new
  end
  def edit
  end
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
      flash[:notice] = 'List was successfully created.'
    else
      render :new
    end
  end
  def update
    if @list.update(list_params)
      redirect_to @list
      flash[:notice] = 'List was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @list.destroy
    redirect_to lists_url
    flash[:notice] = 'List was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def list_params
    params.require(:list).permit(:title, :description)
  end
end
