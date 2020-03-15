class CreatePrivateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :private_topics do |t|
      t.string :title
      t.text :content
      t.string :upload_file_name
      t.binary :upload_file

      t.timestamps
    end
  end
end
