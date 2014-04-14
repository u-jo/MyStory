class AddScrapbookIdToScribbles < ActiveRecord::Migration
  def change
    add_column :scribbles, :scrapbook_id, :integer
  end
end
