class ScorecardsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @title = "Scorecard"
    @scorecard = current_user.scorecards.new
    @scorecards = current_user.scorecards.paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 10)
    @best_score = current_user.scorecards.find(:all, :order => 'total ASC', :limit => 1)
  end
  
  def create
    @scorecard = current_user.scorecards.create({:hole1 => params["hole1"], :hole2 => params["hole2"], :hole3 => params["hole3"],
                                                 :hole4 => params["hole4"], :hole5 => params["hole5"], :hole6 => params["hole6"],
                                                 :hole7 => params["hole7"], :hole8 => params["hole8"], :hole9 => params["hole9"],
                                                 :hole10 => params["hole10"], :hole11 => params["hole11"], :hole12 => params["hole12"],
                                                 :hole13 => params["hole13"], :hole14 => params["hole14"], :hole15 => params["hole15"],
                                                 :hole16 => params["hole16"], :hole17 => params["hole17"], :hole18 => params["hole18"],
                                                 :total => params["total"], :month => params["month"], 
                                                 :large_scorecard => params["large_scorecard"]
                                                })
    @scorecard.update_attribute(:large_scorecard, params["large_scorecard"])
    redirect_to 'index'
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
