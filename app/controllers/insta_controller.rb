class InstaController < ApplicationController

  def index
  	@client = Instagram.client
    @location = @client.media_search("37.745795", "-119.590411")
    @lo_images = @location.first(20)

    @a = Geokit::Geocoders::GoogleGeocoder.geocode 'CA' #'140 Market St, San Francisco, CA'
    @b = @a.lat
    @c = @a.lng

    #@test = @client.location_search("34.108372", "-118.270530", 5000)
    #@test_two = @client.location_recent_media(49846142)


    @x = $twitter.search("*", geocode: "37.745795,-119.590411,1mi").take(5)

    # $y = Yelp::Client.new({ consumer_key: "Xnvaip0-eY6FzwXXgS-Ctw",
    #                         consumer_secret: "T7KBu97EJk9acSbMSe3j1Z5F46c",
    #                         token: "bSIXuYiiYZWLx7cPiYfQQYB5LCP49ps8",
    #                         token_secret: "SBQtXi682Ce-niYRmGR2jNkqCAA"
    #                       })

 
    # @y = $y.search_by_coordinates({ latitude: 37.7577, longitude: -122.4376 })
    # @yelp = $y.search('San Francisco')

    ## search
    coordinates = { latitude: 37.745795, longitude: -119.590411 }
    
    if $y.search_by_coordinates(coordinates)
    @response = $y.search_by_coordinates(coordinates)
    
    @yelp = @response.businesses.take(3)
    end

    
    # [<Business 1>, <Business 2>, ...]

    #@yelp = @ya[0].name
    # "Kim Makoi, DC"

  end

  def show
  	#@remote = Songkickr::Remote.new("0QzVJaHpK8qTeyRY")
    #@result = (params[:location]).delete("0123456789")
    #@results = @remote.venue_search(@result).results 
    @client = Instagram.client

    @address =(params[:address])
    @a = Geokit::Geocoders::GoogleGeocoder.geocode @address
    @lat = @a.lat
    @lng = @a.lng 
    @images = @client.media_search(@lat, @lng)
    @image_one = @images[0]
    @image_two = @images[1]


    @x = $twitter.search("*", geocode: "#{@lat},#{@lng},1mi", lang: "en").take(5)

    #coordinates = { latitude: @lat, longitude: @lng }
    #@response = $y.search_by_coordinates(coordinates) 
    #@yelp = @response.businesses.take(3)

    #@div_test = [ 1, 2, 3]

    #@n = 0
    #hile @n < 3 do
    #  @n +=1
    #end


    #@lat = (params[:lat])
    #@long =(params[:long])
    #@images = @client.tag_recent_media(@result)
    #@images = @client.media_search(@lat, @long)
  end

end
