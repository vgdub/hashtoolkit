
class ApiController < ApplicationController
  respond_to :json


  def get_tweets
    client = twitter_client

    search_query = params[:search]
    twitter_response = client.search(search_query)


    rest_response = []
    twitter_response.statuses.each do |s|
      s = save_tweet(s, search_query)
      rest_response.push(s)
    end

    render :json => rest_response
  end


  def get_hashes
    client = twitter_client

    result = client.search("boston")
    #results = client.search("#ruby -rt", :lang => "ja", :count => 100)

    render :json => result
  end


  # use this rest call "[host]/api/diagnostic?search={hashtag}"
  # to investigate and debug the raw response from the twitter api
  def diagnostic
    client = twitter_client

    search_query = params[:search]
    result = client.search(search_query)

    result.statuses.each do |s|
      save_tweet(s, search_query)
    end

    render :json => result
  end


private 
  def twitter_client
    return Twitter::Client.new(:oauth_token => session[:user_oauth_token],
                                 :oauth_token_secret => session[:user_oauth_secret])
  end


  def save_tweet(twit, search)

      puts "tweet: " + twit.text
      tweet = Tweet.new({ 
        :hashtag => search,
        :tweet_id => twit.id.to_s,
        :text => twit.text,
        :retweet_count => twit.retweet_count.to_s  
      })

      puts "by: " + twit.user.screen_name
      user = TweetUser.new({ 
        :user_id => twit.user.id.to_s, 
        :nickname => twit.user.screen_name,
        :followers_count => twit.user.followers_count,
        :friends_count => twit.user.friends_count
      })

      puts "entity: "

      mentions = []
      twit.user_mentions.each do |mention|
        mentions.push(mention.screen_name)
      end

      twit.hashtags.each do |tags|

      end

      twit.urls.each do |urls|

      end

      
      entity = TweetEntity.new({
        :hashtags => ["thisfun", "ohyeah"],
        :mentions => ["johnnycon", "kvavsfan", "vgdub"],
        :urls => ["http://www.hashtoolkit.com", "http://www.jit.io"]
      })

      tweet.tweet_user = user
      tweet.tweet_entity = entity

      tweet.save!
      return tweet

  end

end

