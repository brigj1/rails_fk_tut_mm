class ChangeTitleToBeTextInExpenses < ActiveRecord::Migration[7.1]
  def change
    change_column :expenses, :title, :text
  end
end
