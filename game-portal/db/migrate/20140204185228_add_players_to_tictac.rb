class AddPlayersToTictac < ActiveRecord::Migration
  def change
    add_column :tictacs, :player1_id, :integer
    add_column :tictacs, :player2_id, :integer
  end
end
