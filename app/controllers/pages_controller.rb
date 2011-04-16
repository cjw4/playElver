class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  
  def index
    if user_signed_in?
      redirect_to scorecards_path
    end
    @title = "Home"
  end
  
  def users
    if params[:search]
      @users = User.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    else
      @users = User.all 
    end
  end
end
