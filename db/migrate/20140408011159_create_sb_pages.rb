class CreateSbPages < ActiveRecord::Migration
  def change
    create_table :sb_pages do |t|
      t.text :scribbles
      t.date :pagedate

      t.timestamps
    end
  end
end
