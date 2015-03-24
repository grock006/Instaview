class FavoritesController < ApplicationController

	def index
		#Finds the favorites by user_id of the current_user logged into the application
		favorites = Favorite.where(user_id: current_user.id) 
		@favorites = favorites.order("created_at DESC")
	end

	def create
		@favorite = Favorite.new(params.require(:favorite).permit(:name, :main_url, :profile_url, :text, :icon, :username, :latitude, :longitude, :user_id, :liked))

		if @favorite.save && current_user
			redirect_to favorites_path
		else
			redirect_to "/signup"
		end    
	
	end

	def like
	    client = Instagram.client(:access_token => session[:access_token])
	    client.like_media("#{params[:id]}")
	    if current_user
	       @favorite = Favorite.create(user_id: current_user.id, instagram_id:(params[:id]), liked: true)
		end
	    redirect_to "/map/show?address=#{params[:address]}"
  	end

  	# current_user.favorite.where(instagram_id: @image_one.id ).liked == true 

	def destroy
		@favorite = Favorite.find(params[:id])
		@favorite.destroy
		redirect_to favorites_path
	end

end
