class PhotosController < ApplicationController
  before_action :signed_in_user
  def index
  	@photos = current_user.photos
  end

  def show
  	@photo = Photo.find(params[:id])
  end

  def new 
  	@photo = Photo.new
  end


  def create

  	@photo = current_user.photos.build(photo_params) do |t|
  		if params[:photo][:image]
  			t.image = params[:photo][:image].tempfile.read
  		end
  	end

  	if @photo.save 
  		redirect_to(@photo, :notice => 'Photo was successfully created.')
  	else
      flash.now[:error] = "Unable to upload photo"
  		render :action => "new"
  	end

  end

  def destroy
  	@photo = Photo.find(params[:id])
  	@photo.destroy
  	redirect_to photos_url
  end

  private 
  	def photo_params
      puts "hello"
  		params.require(:photo).permit(:description, :image => ActionDispatch::Http::UploadedFile)
  	end
end