class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  def index
    @title = "Home"
  end
  
  def topten
    @scores = Scorecard.find(:all, :order => "total ASC", :limit => 10)
    @i = 1
  end

end
