class FavoritesController < ApplicationController

	def index
		@favorites = Favorite.all
	end

	def create
		#@favorite = Favorite.new(name: params[:name], main_url: params[:main_url], profile_url: params[:profile_url])
		@favorite = Favorite.new(params.require(:favorite).permit(:name, :main_url, :profile_url, :text, :icon, :username, :latitude, :longitude))
		if @favorite.save
			redirect_to favorites_path
		end
	end

	def destroy
		@favorite = Favorite.find(params[:id])
		@favorite.destroy
		redirect_to favorites_path
	end

end
