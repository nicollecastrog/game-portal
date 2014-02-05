class AddResultToTictacs < ActiveRecord::Migration
  def change
    add_column :tictacs, :result, :string
  end
end
