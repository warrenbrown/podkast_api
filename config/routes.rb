Rails.application.routes.draw do
  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      resources :users, only: [ :show, :create, :update ]
      resources :podcasts
      resources :episodes
    end
  end
end