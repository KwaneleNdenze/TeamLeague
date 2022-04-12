class ManagersController < ApplicationController

  def index
    @managers = Manager.all
  end

  def show
    @manager = Manager.find(params[:id])
  end

  def new 
    @league = League.find(params[:league_id])
    @team = @league.teams.find(params[:team_id])
    @manager = Manager.new
  end

  def create
    
    @league = League.find(params[:league_id])    
    @team = @league.teams.find(params[:team_id])
     @manager = @team.build_manager(manager_params) #for has_one, belongs_to relationship/association
     @team.save!
     if @manager.errors.none?
    redirect_to league_team_path(league_id:@league.id, id:@team.id)
    else
      render 'new'
    end
  end

  def edit
    @manager = Manager.find(params[:id])
  end

  def update
    @manager = Manager.find(params[:id])
 
  if @manager.update(manager_params)
    redirect_to @manager
  else
    render 'edit'
  end
  end

  def destroy
    @league = League.find(params[:league_id])
    @team = @league.teams.find(params[:team_id])
    @manager = Manager.find(params[:id])
    @manager.destroy
    redirect_to league_team_path(league_id:@league.id, id:@team.id)
  end

  private
  def manager_params
    params.require(:manager).permit(:name)
  end
end