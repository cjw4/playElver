class LeaderboardsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @title = "Leaderboard"
    @users = User.find(:all, :conditions => ['id <> ?', current_user.id])
    
    followed_ids = current_user.following.map(&:id).join(", ")
    @scores_year = Scorecard.find(:all, :order => "total ASC",
                                        :conditions => ["user_id in (#{followed_ids}) OR user_id = ?", current_user.id],
                                        :limit => 10)
    
    @scores_month = Scorecard.find(:all, :order => "total ASC", 
                                         :conditions => ["(user_id in (#{followed_ids}) OR user_id = ?) AND month = ?", current_user, Time.now.month], 
                                         :limit => 10)
                                         
    @scores_week = Scorecard.find(:all, :order => "total ASC", 
                                        :conditions => ["(user_id in (#{followed_ids}) OR user_id = ?) AND created_at > ?", current_user, 1.week.ago], 
                                        :limit => 10)
    @i = 1
    @m = 1
    @w = 1
    
    @time = Time.now
    
    @following = current_user.following.all
  end
end
