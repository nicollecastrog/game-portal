class CreateTictacs < ActiveRecord::Migration
  def change
    create_table :tictacs do |t|
      t.integer :game_id
      t.string :sq0
      t.string :sq1
      t.string :sq2
      t.string :sq3
      t.string :sq4
      t.string :sq5
      t.string :sq6
      t.string :sq7
      t.string :sq8
      t.integer :player1
      t.integer :player2
      t.string :result
      t.references :game

      t.timestamps
    end
    add_index :tictacs, :game_id
  end
end
