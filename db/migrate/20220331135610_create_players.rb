class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :jersey
      t.references :manager

      t.timestamps
    end
  end
end
