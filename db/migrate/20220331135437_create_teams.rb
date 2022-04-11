class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.timestamp
      t.references :league, foreign_key: true
    end
  end
end
