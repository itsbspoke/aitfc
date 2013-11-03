class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :body
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
