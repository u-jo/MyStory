class DashboardController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	include SessionsHelper
	def index
		if signed_in?
			@recent_scribbles = current_user.scribbles.last(5)
		else
			render 'static_pages/home'
		end
	end

	def show
		@recent_scribbles = [] 
		current_user.scribbles.last(5).each do |scribble| 
			@recent_scribbles.push(scribble.scribble_text)
		end
	end


end
