TopThis::Application.routes.draw do
  devise_for :users
  resources :gyms, :routes, :route_completions, :users

  root to: "gyms#index"

  # /api/... Api::
  namespace :api , defaults: {format: 'json'} do
    # /api/v1/... Api::V1::
    namespace :v1 do
      devise_for :users
      resources :gyms, :routes, :route_completions, :users
    end
  end
end
