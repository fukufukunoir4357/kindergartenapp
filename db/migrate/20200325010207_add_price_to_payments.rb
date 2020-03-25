class AddPriceToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :price, :integer
  end
end
