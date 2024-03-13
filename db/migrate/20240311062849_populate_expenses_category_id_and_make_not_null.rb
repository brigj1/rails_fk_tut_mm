class PopulateExpensesCategoryIdAndMakeNotNull < ActiveRecord::Migration[7.1]
  def up
    # Populate new FKs with correct uuid values for referencing back to main table - which we stashed in 'expenses.category_uuid'
    Expense.find_each { |e| e.update(category_id: e.category_uuid) }

    # In rebuilding the FK, null had to be true to allow for no default value to start with.
    # Now set 'nullable' to be false for expenses.category_id:
    change_column_null :expenses, :category_id, false
  end

  def down
  end
end
