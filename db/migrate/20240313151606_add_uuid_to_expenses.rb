class AddUuidToExpenses < ActiveRecord::Migration[7.1]
  def up
    add_column :expenses, :uuid, :uuid, default: "gen_random_uuid()", null: false
    #Inspecting expenses.uuid values would show UUIDv4 values

    #Change expenses.uuid values to UUIDv7 values:
    Expense.find_each { |e| e.update(uuid: SecureRandom.uuid_v7) }
    #Inspecting expenses.uuid values should show UUIDv7 values

  end

  def down
  end
end
