require 'api_constraints'

Rails.application.routes.draw do

  devise_for :platform_users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
    resources :sessions, only: :create do
      collection do
        get :current
        put :refresh_token
        delete :destroy, path: ""
      end
    end
    resources :forms, only: [:index, :show], param: :key
    resources :processes, only: [:create, :continue_later], param: :key do
      member do
        post :create
        post :continue_later
      end
    end
    resources :processes, only: :continue_later do
      member do
        put :continue_later
      end
    end
    resources :documents, only: :index
  end

end
