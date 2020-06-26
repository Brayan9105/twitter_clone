Rails.application.routes.draw do
  root 'pages#feed'
  devise_for :users
  resources :tweets, except: [:show]
  get '/:user_id/tweets/:tweet_id', to: 'tweets#show', as: 'user_tweet'
  get '/:user_id/tweets', to: 'users#show', as: 'user_tweets'

end
