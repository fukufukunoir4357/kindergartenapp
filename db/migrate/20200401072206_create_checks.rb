class CreateChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :checks do |t|
      t.references :user, foreign_key: true
      t.references :private_topic, foreign_key: true

      t.timestamps
    end
  end
end
