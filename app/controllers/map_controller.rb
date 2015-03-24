class MapController < ApplicationController
  def index
    # latitude and longitude values passed into the Google street view map
  	@lat = 37.726639
    # 37.739624
  	@lng = -119.543848
    # -119.576333
       #else set client for Instagram API call
        @client = Instagram.client
        # And pass latitude and longitude into the Instagram API client call
        # Instagram client in config/initializers/instagram.rb
        @images = @client.media_search(@lat, @lng)
        # Captures first six recent images in the Instagram recent media search API call
        @image_one = @images[0]
        @image_two = @images[1]
        @image_three = @images[2]
        @image_four = @images[3]
        @image_five = @images[4]
        @image_six = @images[5]


        # Passes the same latitude and longitude into Twitter API call, finds "*" all tweets within 10 miles of that latitude and longitude
        # and takes the first(3) objects that return
        # Twitter client in config/initializers/twitter.rb
        @tweets = $twitter.search("*", geocode: "#{@lat},#{@lng},10mi", lang: "en").take(3) 
        #Captures the first two twitter API call objects 
        @tweet_one = @tweets[0]
        @tweet_two = @tweets[1]      
  end

  def show

    # Takes address params from the search bar
    @address =(params[:address])

    # Passes address into the Geokit gem
    @a = Geokit::Geocoders::GoogleGeocoder.geocode @address

    # Translates geokit address into latitude and longitude
    @lat = @a.lat
    @lng = @a.lng 

    # if latitude and longitude values are nil, redirect to the index page
        if @lat == nil && @lng == nil 
          redirect_to "/map"
        else
        #else set client for Instagram API call
        @client = Instagram.client
        # And pass latitude and longitude into the Instagram API client call
        # Instagram client in config/initializers/instagram.rb
        @images = @client.media_search(@lat, @lng)
        # Captures first six recent images in the Instagram recent media search API call
        @image_one = @images[0]
        @image_two = @images[1]
        @image_three = @images[2]
        @image_four = @images[3]
        @image_five = @images[4]
        @image_six = @images[5]


        # Passes the same latitude and longitude into Twitter API call, finds "*" all tweets within 10 miles of that latitude and longitude
        # and takes the first(3) objects that return
        # Twitter client in config/initializers/twitter.rb
        @tweets = $twitter.search("*", geocode: "#{@lat},#{@lng},10mi", lang: "en").take(3) 
        #Captures the first two twitter API call objects 
        @tweet_one = @tweets[0]
        @tweet_two = @tweets[1]      
      end

  end


end
