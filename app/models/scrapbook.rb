class Scrapbook < ActiveRecord::Base
	has_many :sb_pages
	has_many :scribbles
	belongs_to :user

	validates :user_id, presence: true
	
	def create_sb_page
		sb_page = sb_pages.build
		sb_page.save
		return sb_page
	end

	def create_scribble(scribble_text)
		scribbles.build(scribble_text: scribble_text, user_id: :user_id)
	end
end
