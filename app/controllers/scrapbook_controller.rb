class ScrapbookController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	
	def index 
		if signed_in?
		else
			redirect_to signin_url, notice: "Please sign in." 
		end
	end

	def create_scribble
		scribble = current_scrapbook.create_scribble
		if scribble.save
			flash[:success] = "Scribble is saved!"
		else
			flash.now[:error] = "Please try again!"
		end
	end


	
	
end
