class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params([:session][:password]))
      log_in user
      redirect_to user
    else
      flash.now[:danger]="Recheck you name or password and try again"
      render 'new'
    end
  end
end
