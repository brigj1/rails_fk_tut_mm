class RenameOldIdInExpenses < ActiveRecord::Migration[7.1]
  def change
    rename_column :expenses, :old_id, :int_id
  end
end
