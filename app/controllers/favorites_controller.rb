class FavoritesController < ApplicationController

	def index
		#@favorites = Favorite.all
		@favorites = Favorite.where(user_id: current_user.id) 
	end

	def create
		@favorite = Favorite.new(params.require(:favorite).permit(:name, :main_url, :profile_url, :text, :icon, :username, :latitude, :longitude, :user_id))

		if @favorite.save && current_user
			redirect_to favorites_path
		else
			redirect_to "signup"
		end    
	
	end

	def destroy
		@favorite = Favorite.find(params[:id])
		@favorite.destroy
		redirect_to favorites_path
	end

end
