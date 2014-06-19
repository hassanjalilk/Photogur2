class PicturesController < ApplicationController

	def index
		@pictures = Picture.all
	end

	def show
		@picture = Picture.find(params[:id])
	end

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.new(picture_params)
		if picture.save
			redirect_to picture_url
		else
			render :new
		end
	end

	def edit
		@picture = Picture.find(params[:id])
	end

	def update
		@picture = Picture.find(params[:id])

		if picture.update_attribute(picure_params)
			redirect_to "/pictures"
		else
			render :edit
		end
	end

	def destroy
		@picture = Picture.find(params[:id])
		@picture.destroy
		redirect_to picture_url
	end

	private

	def picture_params
		params.require(:Picture).permit(:artist, :title, :url)
	end


end






