class DropRedundantTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :articles_fixes
    drop_table :datafiles
  end
end