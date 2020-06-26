Rails.application.routes.draw do
  root 'pages#feed'
  devise_for :users
  resources :tweets, except: [:show]
  get '/:user_id/tweets/:tweet_id', to: 'tweets#show', as: 'user_tweet'
  get '/:user_id/tweets', to: 'users#show', as: 'user_tweets'

  get '/:user_id/followers', to: 'follows#follower_users', as: 'follower_users'
  get '/:user_id/followings', to: 'follows#following_users', as: 'followings_users'

end
