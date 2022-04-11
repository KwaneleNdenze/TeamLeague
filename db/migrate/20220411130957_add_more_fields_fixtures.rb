class AddMoreFieldsFixtures < ActiveRecord::Migration[5.2]
  def change
    add_column :fixtures, :home_team_id, :integer
    add_column :fixtures, :away_team_id, :integer
  end
end
