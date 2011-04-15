module ScorecardsHelper
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
