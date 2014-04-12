class Scrapbook < ActiveRecord::Base
	has_many :sb_pages
	belongs_to :user

	def createSBPage()
		sbpage = SbPage.new
		sbpage.scrapbook = self
		sbpage.save
		return sbpage
	end
end
