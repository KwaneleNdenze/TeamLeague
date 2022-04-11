class ResultsController < ApplicationController

  def index
    @league = League.find(params[:league_id])
    if params[:home_team_result] != nil 
      @result = Fixture.all
    end
    
  end

  def edit
    @league = League.find(params[:league_id])
    @result = Fixture.find(params[:id])
  end

  

  private
  def result_params
    params.require(:fixture).permit(:home_team, :away_team, :home_team_result, :away_team_result, :home_team_score, :away_team_score)
  end
end