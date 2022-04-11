class FixturesController < ApplicationController

  def index
    @league = League.find(params[:league_id])
    @fixtures = @league.fixtures.where(home_team_result: nil)
    
  end

  def show
    @league = League.find(params[:league_id])
    @fixture = @league.fixtures.find(params[:league_id])
  end

  def new
    @league = League.find(params[:league_id])
    @fixture = @league.fixtures.build
  end

  def create
    @league = League.find(params[:league_id])

    @fixture = @league.fixtures.create(fixture_params)
    if @fixture.errors.none?
    redirect_to league_fixtures_path(@league)
    else 
      render 'new'
    end
  end

  def edit
    @league = League.find(params[:league_id])
    @fixture = Fixture.find(params[:id])
        
  end

  def update
    @league = League.find(params[:league_id])
    @fixture = Fixture.find(params[:id])
  
    if @fixture.update(fixture_params)
      @home = @fixture.home_team_score.to_i
      @away = @fixture.away_team_score.to_i

    if @home > @away
      @fixture.home_team_result = "W"
      @fixture.away_team_result = "L"
    end
   
    if @home < @away
      @fixture.home_team_result = "L"
      @fixture.away_team_result = "W"
    end

    if @home == @away
      @fixture.home_team_result = "D"
      @fixture.away_team_result = "D"
    end

    
    @home_team = Team.where(id:@fixture.league_id, name:@fixture.home_team )
    @away_team = Team.where(id:@fixture.league_id, name: @fixture.away_team).collect{ |t| [ t.name ] }


    byebug
    @fixture.update(fixture_params)
   
      if @fixture.home_team_score.present?
      redirect_to league_results_path(@league) 
       
     else
      redirect_to league_fixtures_path(@league)
       
     end
        
    else
      render 'edit'
    end
    
  end

  def destroy
    @league = League.find(params[:league_id])
    @fixture = @league.fixtures.find(params[:id])
    @fixture.destroy
    redirect_to league_fixtures_path(@league)
    
  end

  private
  def fixture_params
    params.require(:fixture).permit(:home_team, :away_team, :date, :home_team_score, :away_team_score, :home_team_result, :away_team_result)
  end
end