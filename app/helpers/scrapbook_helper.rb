module ScrapbookHelper
	def current_scrapbook 
		return current_user.scrapbook
	end
end
