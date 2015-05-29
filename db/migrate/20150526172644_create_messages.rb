class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :author
      t.integer :topic_id

      t.timestamps
    end
  end
end
