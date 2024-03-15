class RemoveOldCategoryIdAndCategoryUuidFromExpenses < ActiveRecord::Migration[7.1]
  def change
    remove_column :expenses, :old_category_id
    remove_column :expenses, :category_uuid
  end
end
