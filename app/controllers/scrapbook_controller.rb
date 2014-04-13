class ScrapbookController < ApplicationController

	def index 
		if signed_in?
			
		else
			redirect_to signin_url, notice: "Please sign in." 
		end
	end


end
