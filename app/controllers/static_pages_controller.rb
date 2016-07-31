class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @list = current_user.lists.build 
      @todo_list =current_user.todo_list
    end
  end

  def help
  end

  def about
  end
end
