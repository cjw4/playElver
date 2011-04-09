class ScorecardsController < ApplicationController
  def index
    @scorecard = Scorecard.new
    @scorecards = Scorecard.all
  end
  
  def create
    @scorecard = Scorecard.new(params[:scorecard])
    if @scorecard.save
      redirect_to scorecards_path
    else
      flash[:error] = "Your round could not be saved!"
      render root_path
    end
  end

end
