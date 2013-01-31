TopThis::Application.routes.draw do
  devise_for :users

  namespace :api , defaults: {format: 'json'} do
    # /api/... Api::
    namespace :v1 do
      resources :gyms, :routes
    end
  end

  resources :gyms, :routes

  root to: "gyms#index"
end
