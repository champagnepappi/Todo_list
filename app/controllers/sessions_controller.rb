class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params([:session][:password]))
    else
      flash.now[:danger]="Recheck you name and password and try again"
      render 'new'
    end
  end
end
