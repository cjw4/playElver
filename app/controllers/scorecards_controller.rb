class ScorecardsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @title = "Scorecard"
    @scorecard = current_user.scorecards.new
    @scorecards = current_user.scorecards.paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 3)
    @best_score = current_user.scorecards.find(:all, :order => 'total ASC', :limit => 1)
  end
  
  def create
    @scorecard = current_user.scorecards.build(params[:scorecard])
    if @scorecard.save
      redirect_to scorecards_path
    else
      flash[:error] = "Your round could not be saved!"
      redirect_to scorecards_path
    end
  end
  
  def destroy
    @scorecard = current_user.scorecards.find(params[:id])
    
    if @scorecard.destroy
      flash[:success] = "Your round was successfully deleted!"
      redirect_to scorecards_path
    end
  end

end
