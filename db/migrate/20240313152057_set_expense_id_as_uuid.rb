class SetExpenseIdAsUuid < ActiveRecord::Migration[7.1]
  def up
    # Start using the :uuid column as the :id column via renaming.
    # First, make :id content accessible by renaming it to :old_id
    rename_column :expenses, :id, :old_id
    rename_column :expenses, :uuid, :id

    execute "ALTER TABLE expenses drop constraint expenses_pkey;"
    execute "ALTER TABLE expenses ADD PRIMARY KEY (id);"
  end

  def down
  end
end
