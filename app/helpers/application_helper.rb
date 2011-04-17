module ApplicationHelper
  
  def title
    if @title
      @title + " | playElver"
    else
      "playElver"
    end
  end
  
  def best_score
    @best_score = current_user.scorecards.find(:all, :order => 'total ASC', :limit => 1)
  end
  
  def score(scorecard)
    score = scorecard.total - 54
    if score == 0 
      "E"
    elsif score >= 0
      "+#{score}"
    else
      score
    end
  end
end
