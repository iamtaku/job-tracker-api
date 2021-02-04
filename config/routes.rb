Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :jobs,only: [:index, :create, :update, :destroy] do
        resources :steps, only: [:create]
      end
      resources :steps, only: [:destroy, :update, :show]
      post 'authenticate', to: 'authentication#create'
    end
  end

end

