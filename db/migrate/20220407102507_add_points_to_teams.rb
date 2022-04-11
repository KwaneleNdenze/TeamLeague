class AddPointsToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :points, :string
  end
end
