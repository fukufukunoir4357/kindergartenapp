class ChangeDefaoultUserColumn < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :admin, :boolean, default: false 
  end
  
  def down
    cange_column :users, :admin, :boolean
  end
  
end
