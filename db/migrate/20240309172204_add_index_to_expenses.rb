class AddIndexToExpenses < ActiveRecord::Migration[7.1]
  def change
    add_index :expenses, :category_id
  end
end
