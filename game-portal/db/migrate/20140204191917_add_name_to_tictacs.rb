class AddNameToTictacs < ActiveRecord::Migration
  def change
    add_column :tictacs, :name, :string
  end
end
