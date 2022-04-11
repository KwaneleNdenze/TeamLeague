class ChangeScoreToHomeTeamScore < ActiveRecord::Migration[5.2]
  def change
    rename_column :fixtures, :score, :home_team_score
  end
end
