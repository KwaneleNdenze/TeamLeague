class TeamsController < ApplicationController
  
  def index
    @teams = Team.all 
  end

  def show    
    @team = Team.find(params[:id]) 
  end

  def new
    @league = League.find(params[:league_id])
    @team = @league.teams.build
  end

  def create
    @league = League.find(params[:league_id])
    @team = @league.teams.create(team_params)
    
    if @team.errors.none?
    redirect_to league_path(@league)
    else 
      render 'new'
    end
  end

  def edit
    @league = League.find(params[:league_id])
    @team = @league.teams.find(params[:id])
  end

  def update
    @league = League.find(params[:league_id])
    @team = @league.teams.find(params[:id])
    if @team.update(team_params)
      redirect_to @league
    else
      render 'edit'
    end
  end

  def destroy
    @league = League.find(params[:league_id])
    @team = @league.teams.find(params[:id])
    @team.destroy
    redirect_to league_path(@league)
  end

  private
  def team_params
    params.require(:team).permit(:name, :points)
  end
end