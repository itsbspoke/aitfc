class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start_time, :null => false
      t.string :venue
      t.string :title, :null => false

      t.timestamps
    end
  end
end
