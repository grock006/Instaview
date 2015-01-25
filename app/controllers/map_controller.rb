class MapController < ApplicationController
  def index
  	@lat = 37.739624
  	@lng = -119.576333
  end

  def show

    # Takes address params from the search bar
    @address =(params[:address])
    @search_field = (params[:search_field])
    @search = @search_field.to_i

    # Passes address into the Geokit gem
    # @latlng = "37.739624, -119.576333"
    # Geokit::Geocoders::GoogleGeocoder.geocode @latlng
    @a = Geokit::Geocoders::GoogleGeocoder.geocode @address

    # Translates geokit address into latitude and longitude and passes them into latitude and longtidue
    @lat = @a.lat
    @lng = @a.lng 

    # if latitude and longitude values are nil, redirect to the index page
        if @lat == nil && @lng == nil || @search_field == nil
          redirect_to "/map"
        else

        #Instagram API call
        @client = Instagram.client
        @images = @client.media_search(@lat, @lng)
        @image_one = @images[0]
        @image_two = @images[1]
        @image_three = @images[2]
        @image_four = @images[3]
        @image_five = @images[4]
        @image_six = @images[5]


        #Twitter API call
        @tweets = $twitter.search("*", geocode: "#{@lat},#{@lng},10mi", lang: "en").take(3) 
        #@tweets = $twitter.search("*", geocode: "#{@lat},#{@lng}, #{@search}mi", lang: "en").take(3)    

        @tweet_one = @tweets[0]
        @tweet_two = @tweets[1]

        #Yelp API call
        #  $y = Yelp::Client.new({ consumer_key: "Xnvaip0-eY6FzwXXgS-Ctw",
        #                      consumer_secret: "T7KBu97EJk9acSbMSe3j1Z5F46c",
        #                      token: "bSIXuYiiYZWLx7cPiYfQQYB5LCP49ps8",
        #                      token_secret: "SBQtXi682Ce-niYRmGR2jNkqCAA"
        #                    })

        # coordinates = { latitude: @lat, longitude: @lng }
        # #@response = $y.search_by_coordinates(coordinates)
        #  @response = $y.search(@address, { radius_filter: @search})
        #   if @response != nil
        #     @yelp_one = @response.businesses[0]
        #     @yelp_two = @response.businesses[1]
        #   else
        #     redirect_to "/map"
        # end
      
      end

  end


end
