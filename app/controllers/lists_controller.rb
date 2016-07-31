class ListsController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update,:create, :destroy]
  before_action :correct_user, only: :destroy

  def show
    @list = List.find(params[:id])
  end
  def edit
    @list = List.find(params[:id])
  end
  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to root_path
      flash[:notice] = 'List was successfully created.'
    else
      @todo_list =[]
      render 'static_pages/home'
    end
  end
  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to @list
      flash[:notice] = 'List was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to request.referrer || root_url
    flash[:notice] = 'List was successfully destroyed.'
  end

  private
  def list_params
    params.require(:list).permit(:title, :description)
  end
end
