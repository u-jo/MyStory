class Scribble < ActiveRecord::Base
	belongs_to :user
	belongs_to :scrapbook
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true
end
