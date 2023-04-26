Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :routes, only: [:create, :show] do
        resources :trips, only: [:create] do
          member do
            patch 'complete', to: 'trips#complete'
          end
          resources :actions, only: [:create]
        end
      end
    end
  end
end
