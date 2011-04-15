class LeaderboardsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @title = "Leaderboard"
    @users = User.find(:all, :conditions => ['id <> ?', current_user.id])
    @scores = Scorecard.find(:all, :order => "total ASC", :limit => 10)
    @best_score = current_user.scorecards.find(:all, :order => 'total ASC', :limit => 1)
    @scores_month = Scorecard.find(:all, :order => "total ASC", :conditions => ['month = ?', Time.now.month], :limit => 10)
    @scores_week = Scorecard.find(:all, :order => "total ASC", :conditions => ['created_at > ?', 1.week.ago], :limit => 10)
    @i = 1
    @m = 1
    @w = 1
    
    @time = Time.now
  end
end
