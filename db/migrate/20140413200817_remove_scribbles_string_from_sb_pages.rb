class RemoveScribblesStringFromSbPages < ActiveRecord::Migration
  def change
    remove_column :sb_pages, :scribbles, :string
  end
end
