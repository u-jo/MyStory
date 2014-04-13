class Scrapbook < ActiveRecord::Base
	has_many :sb_pages
	belongs_to :user

	def create_sb_page
		sb_page = sb_pages.build
		sb_page.save
		return sb_page
	end
end
