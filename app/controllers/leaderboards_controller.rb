class LeaderboardsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @title = "Leaderboard"
    @users = User.find(:all, :conditions => ['id <> ?', current_user.id])
  end

end
