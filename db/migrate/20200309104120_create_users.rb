class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :firstchild
      t.string :secondchild
      t.string :thirdchild
      t.string :password_digest
      t.string :email
      t.boolean :admin

      t.timestamps
    end
  end
end
