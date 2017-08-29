require 'api_constraints'

Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
    resources :sessions, only: :create do
      collection do
        get :current
        put :refresh_token
        delete :destroy, path: ""
      end
    end
    resources :forms, only: :index do
      get ':type', to: 'forms#register', on: :collection
    end
  end

end
