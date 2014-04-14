class CreateScribbles < ActiveRecord::Migration
  def change
    create_table :scribbles do |t|
      t.integer :user_id
      t.integer :sb_page_id
      t.string :scribble_text

      t.timestamps
    end
  end
end
