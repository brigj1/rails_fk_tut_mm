class CategoryIdInExpensesIsForeignKey < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :expenses, :categories, column: :category_id
  end
end
