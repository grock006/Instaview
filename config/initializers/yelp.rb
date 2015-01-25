$y = Yelp::Client.new({ consumer_key: ENV['yelp_consumer_key'],
                            consumer_secret: ENV['yelp_consumer_key'],
                            token: ENV['yelp_token'],
                            token_secret: ENV['yelp_token_secret']
                          })