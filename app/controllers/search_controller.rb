require "twitter"

class SearchController < ApplicationController
  layout "guest" #need to specify, not for signup process or login process

  respond_to :json

  def index

    client = Twitter::Client.new(:oauth_token => session[:user_oauth_token],
                                 :oauth_token_secret => session[:user_oauth_secret])


    #t = client.search("railsrumble", :q:lang => "en", :rpp => 1)
    t = client.search("#ruby -rt", :lang => "ja", :count => 100)

    #b = JSON.parse(t)
    render :json => t

    return

    @search = Search.new
    @search.name = "TheReturn"
    @search.query = "TheReturn2"
    @search.results = ['me', 'you', 'someone', 'everyone']
    render :json => @search
  end
  
  def byuser
    client = twitter_client()
    b = client.search("chicago")

    render :json => b
  end

  def create
    
  end

private 
  def twitter_client
    return Twitter::Client.new(:oauth_token => session[:user_oauth_token],
                                 :oauth_token_secret => session[:user_oauth_secret])
  end

end
