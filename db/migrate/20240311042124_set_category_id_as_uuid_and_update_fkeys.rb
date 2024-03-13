class SetCategoryIdAsUuidAndUpdateFkeys < ActiveRecord::Migration[7.1]
  def up
    # Fill the expenses.category_uuid with the value from categories.uuid
    Expense.includes(:category).find_each { |expense| expense.update(category_uuid: expense.category.uuid.to_s) }

    # Remove FK dependencies
    remove_reference :expenses, :category, null: true, foreign_key: true, index: true

    # Replace :id info with :uuid info - safely
    rename_column :categories, :id, :old_id
    rename_column :categories, :uuid, :id

    execute "ALTER TABLE categories drop constraint categories_pkey;"
    execute "ALTER TABLE categories ADD PRIMARY KEY (id);"

    # Rebuild FKs
    add_reference :expenses, :category, null: true, foreign_key: true, index: true, type: :uuid
  end

  def down
  end
end
