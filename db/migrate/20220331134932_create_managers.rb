class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.string :name
      t.timestamps
      t.references :team, foreign_key: true
    end
  end
end
