class TournamentsController < ApplicationController
 def index
    @league = League.find(params[:league_id])
    @fixtures = @league.fixtures
    
    team_ids = @league.teams.map(&:id)

    generated_data = {}

    team_ids.each do |tid|
      generated_data[tid] = {
        team: nil,
        matches_played: 0,
        won: 0,
        lost: 0,
        drew: 0,
        points: 0,
        goal_difference: 0,
        goals_for:0,
        goals_against:0
      }
    end

    @fixtures.each do |fixture|
      generated_data[fixture.home_team_id][:matches_played] += 1
      generated_data[fixture.away_team_id][:matches_played] += 1

      calculate_home_team_scores(fixture, generated_data)
      calculate_away_team_scores(fixture, generated_data)

      generated_data[fixture.home_team_id][:goal_difference] += (fixture.home_team_score.to_i - fixture.away_team_score.to_i)
      generated_data[fixture.away_team_id][:goal_difference] += (fixture.away_team_score.to_i - fixture.home_team_score.to_i)

      generated_data[fixture.home_team_id][:goals_for] += fixture.home_team_score.to_i
      generated_data[fixture.away_team_id][:goals_for] += fixture.away_team_score.to_i

      generated_data[fixture.home_team_id][:goals_against] += fixture.away_team_score.to_i
      generated_data[fixture.away_team_id][:goals_against] += fixture.home_team_score.to_i

    end

    # Adding the team names
    generated_data.keys.each do |id|
      team_name = Team.find(id).name
      generated_data[id][:team] = team_name
    end

    # sort
    sorted_by_points = generated_data.values.sort { |team_a, team_b| team_b[:points] <=> team_a[:points] }

    @table_data = sorted_by_points
  end

  def calculate_home_team_scores(fixture, generated_data)
    if fixture.home_team_result == 'W'
      generated_data[fixture.home_team_id][:won] += 1
      generated_data[fixture.home_team_id][:points] += 3
    elsif fixture.home_team_result == 'L'
      generated_data[fixture.home_team_id][:lost] += 1
    else
      generated_data[fixture.home_team_id][:drew] += 1
      generated_data[fixture.home_team_id][:points] += 1
    end
  end

  def calculate_away_team_scores(fixture, generated_data)
    if fixture.away_team_result == 'W'
      generated_data[fixture.away_team_id][:won] += 1
      generated_data[fixture.away_team_id][:points] += 3
    elsif fixture.away_team_result == 'L'
      generated_data[fixture.away_team_id][:lost] += 1
    else
      generated_data[fixture.away_team_id][:drew] += 1
      generated_data[fixture.away_team_id][:points] += 1
    end
  end
end