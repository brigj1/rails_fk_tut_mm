class AddUuidToCategory < ActiveRecord::Migration[7.1]
  def up
    add_column :categories, :uuid, :uuid, default: "gen_random_uuid()", null: false
    #Inspecting categories.uuid values should show UUIDv4 values

    #Change categories.uuid values to UUIDv7 values:
    Category.find_each { |p| p.update(uuid: SecureRandom.uuid_v7) }
    #Inspecting categories.uuid values should show UUIDv7 values


    add_column :expenses, :old_category_id, :bigint, null: true

    #Copy current integer id values for foreign keys to 'old_category_id' column:
    Expense.find_each { |s| s.update(old_category_id: s.category_id) }
    #Inspecting expenses.old_category_id values should show original integer id values


    add_column :expenses, :category_uuid, :uuid
  end

  def down
  end
end
