class LogsController < ApplicationController

  def index
    @league = League.find(params[:league_id])
    
    
       
  end
end