class Createscribbles < ActiveRecord::Migration
  def change
    create_table :scribbles do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :scribbles, [:user_id, :created_at]
  end
end
