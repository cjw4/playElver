class LeaderboardsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @title = "Leaderboard"
    @users = User.all
  end

end
