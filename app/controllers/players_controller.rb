class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @league = League.find(params[:league_id])
    @team = @league.teams.find(params[:team_id])
    @player = Player.new
  end

  def create
    
    @league = League.find(params[:league_id])
    @team = @league.teams.find(params[:team_id])
    @player = @team.manager.players.create(player_params)
    
    if @player.errors.none?
    redirect_to league_team_path(league_id:@league.id, id:@team.id)
    else
      render 'new'
    end
    
  end

  def edit
    @league = League.find(params[:league_id])
    @team = @league.teams.find(params[:team_id])
    @player = @team.manager.players.find(params[:id])
  end

  def update
    @league = League.find(params[:league_id])
    @team = @league.teams.find(params[:team_id])
    @player = @team.manager.players.find(params[:id])
    if @player.update(player_params)
      redirect_to league_team_path(league_id:@league.id, id:@team.id)
    else
      render 'edit'
    end
  end

  def destroy
    @league = League.find(params[:league_id])
    @team = @league.teams.find(params[:team_id])
    @player = @team.manager.players.find(params[:id])
    @player.destroy
    redirect_to league_team_path(league_id:@league.id, id:@team.id)
  end

  private
  def player_params
    params.require(:player).permit(:name, :jersey)
  end
end