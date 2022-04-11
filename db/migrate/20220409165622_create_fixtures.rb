class CreateFixtures < ActiveRecord::Migration[5.2]
  def change
    create_table :fixtures do |t|
      t.string :home_team
      t.string :away_team
      t.date :date
      t.string :result
      t.string :score
      t.references :league, foreign_key: true
      t.timestamps
    end
  end
end
