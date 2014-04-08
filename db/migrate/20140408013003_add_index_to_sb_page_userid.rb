class AddIndexToSbPageUserid < ActiveRecord::Migration
  def change
  	add_index :sb_pages, [:user_id, :created_at]
  end
  
end
