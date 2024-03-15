class RenameOldIdInCategories < ActiveRecord::Migration[7.1]
  def change
    rename_column :categories, :old_id, :int_id
  end
end
