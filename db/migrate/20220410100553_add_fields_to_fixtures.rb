class AddFieldsToFixtures < ActiveRecord::Migration[5.2]
  def change
    add_column :fixtures, :away_team_result, :string
    add_column :fixtures, :away_team_score, :string
  end
end
