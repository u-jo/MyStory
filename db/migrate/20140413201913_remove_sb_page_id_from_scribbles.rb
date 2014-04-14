class RemoveSbPageIdFromScribbles < ActiveRecord::Migration
  def change
    remove_column :scribbles, :sb_page_id, :integer
  end
end
