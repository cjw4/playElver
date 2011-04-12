class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  
  def index
    if user_signed_in?
      @scorecard = current_user.scorecards.new
      @scorecards = current_user.scorecards.paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 3)
    end
    @title = "Home"
  end
  
end
