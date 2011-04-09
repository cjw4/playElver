module ApplicationHelper
  
  def title
    if @title
      @title + " | playElver"
    else
      "playElver"
    end
  end
end
