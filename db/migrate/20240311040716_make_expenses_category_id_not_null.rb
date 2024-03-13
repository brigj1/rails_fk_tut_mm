class MakeExpensesCategoryIdNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :expenses, :category_id, false
  end
end
