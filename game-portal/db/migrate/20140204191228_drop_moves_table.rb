class DropMovesTable < ActiveRecord::Migration
  def up
    drop_table :moves
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
