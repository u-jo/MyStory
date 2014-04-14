class StaticPagesController < ApplicationController
	
  def home
  	if signed_in?
  		@scribble = current_user.scribbles.build if signed_in?
  		@feed_items = current_user.feed.paginate(page: params[:page])
      @recent_scribbles = current_user.scribbles.last(5).reverse
  	end
  end

  def help
  end

  def about
  end

  def contact	
  end

end
