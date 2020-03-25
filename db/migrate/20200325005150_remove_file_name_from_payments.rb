class RemoveFileNameFromPayments < ActiveRecord::Migration[5.2]
  def up
    remove_column :payments, :file_name, :string
  end
  
  def down
    add_column :payments, :file_name, :string
  end
  
end
