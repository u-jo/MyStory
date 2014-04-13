class AddUserIdToSbPages < ActiveRecord::Migration
  def change
  	add_column	:sb_pages, :user_id, :integer
  end
end
