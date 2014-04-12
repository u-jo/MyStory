class AddScrapbookidToSbPage < ActiveRecord::Migration
  def change
  	add_column :sb_pages, :scrapbook_id, :integer
  end
end
