class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.references :picture, foreign_key: true
      t.string :file_name
      t.integer :howmany

      t.timestamps
    end
  end
end
