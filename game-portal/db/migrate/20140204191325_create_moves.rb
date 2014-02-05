class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :tictac_id
      t.integer :player_id
      t.integer :square
      t.string :symbol
      t.references :tictac

      t.timestamps
    end
    add_index :moves, :tictac_id
  end
end
