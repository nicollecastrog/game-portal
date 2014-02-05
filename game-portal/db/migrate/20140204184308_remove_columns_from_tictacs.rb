class RemoveColumnsFromTictacs < ActiveRecord::Migration
  def change
    remove_column :tictacs, :sq0, :string
    remove_column :tictacs, :sq1, :string
    remove_column :tictacs, :sq2, :string
    remove_column :tictacs, :sq3, :string
    remove_column :tictacs, :sq4, :string
    remove_column :tictacs, :sq5, :string
    remove_column :tictacs, :sq6, :string
    remove_column :tictacs, :sq7, :string
    remove_column :tictacs, :sq8, :string
    remove_column :tictacs, :result, :string
    remove_column :tictacs, :player1, :integer
    remove_column :tictacs, :player2, :integer
  end
end
