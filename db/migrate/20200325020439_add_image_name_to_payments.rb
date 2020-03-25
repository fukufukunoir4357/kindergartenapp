class AddImageNameToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :image_name, :string
  end
end
