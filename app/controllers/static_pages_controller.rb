class StaticPagesController < ApplicationController
	
  def home
  	if signed_in?
      @user = current_user
  		@scribble = current_user.scribbles.build if signed_in?
      @recent_scribbles = @user.scribbles.last(5).reverse
  	end
  end

  def help
  end

  def about
  end

  def contact	
  end

end
