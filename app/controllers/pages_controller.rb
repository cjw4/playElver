class PagesController < ApplicationController
  def index
    @title = "Home"
  end
  
  def topten
    @scores = Scorecard.find(:all, :order => "total ASC", :limit => 10)
  end

end
