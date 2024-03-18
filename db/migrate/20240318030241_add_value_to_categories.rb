class AddValueToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :value, :bigint
  end
end
