class LeaderboardsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @title = "Leaderboard"
    @users = User.find(:all, :conditions => ['id <> ?', current_user.id])
    @scores = Scorecard.find(:all, :order => "total ASC", :limit => 10)
    @i = 1
  end

end
