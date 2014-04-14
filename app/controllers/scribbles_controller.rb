class ScribblesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @scribble = current_user.scribbles.build(scribble_params)
    if @scribble.save
      flash[:success] = "Scribble recorded!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @scribble.destroy
    redirect_to root_url
  end

  private

    def scribble_params
      params.require(:scribble).permit(:content)
    end

    def correct_user
      @scribble = current_user.scribbles.find_by(id: params[:id])
      redirect_to root_url if @scribble.nil?
    end
end