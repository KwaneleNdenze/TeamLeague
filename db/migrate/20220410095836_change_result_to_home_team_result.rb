class ChangeResultToHomeTeamResult < ActiveRecord::Migration[5.2]
  def change
    rename_column :fixtures, :result, :home_team_result
  end
end
