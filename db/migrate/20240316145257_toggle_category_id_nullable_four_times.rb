class ToggleCategoryIdNullableFourTimes < ActiveRecord::Migration[7.1]
  def up
    # Set 'nullable' to be 'true' for 'expenses.category_id':
    change_column_null :expenses, :category_id, true

    # Flip back to 'false'
    change_column_null :expenses, :category_id, false

    # Repeat:

    # Set 'nullable' to be 'true' for 'expenses.category_id':
    change_column_null :expenses, :category_id, true

    # Flip back to 'false'
    change_column_null :expenses, :category_id, false
  end

  def down
  end
end
