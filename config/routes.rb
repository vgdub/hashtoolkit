Hashtoolkit::Application.routes.draw do

  root :to => "home#index"

  get 'auth/twitter/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'


  get '/main', to: 'user#show', as: 'user'

  get '/search', to: 'search#index'
  get '/byuser', to: 'search#byuser'


  scope "api" do
    get "get_tweets" => "api#get_tweets"
    get "get_hashes" => "api#get_hashes"
    get "diagnostic" => "api#diagnostic"
  end

end
