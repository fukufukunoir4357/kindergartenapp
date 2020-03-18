class CreateEntryTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :entry_topics do |t|
      t.string :term
      t.string :reception_day
      t.text :information
      t.string :upload_file_name
      t.binary :upload_file

      t.timestamps
    end
  end
end
