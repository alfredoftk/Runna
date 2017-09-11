require 'api_constraints'

Rails.application.routes.draw do

  devise_for :platform_users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
    resources :sessions, only: :create do
      collection do
        get :current
        put :refresh_token
        delete :destroy, path: ''
      end
    end
    resources :forms, only: [:index, :show], param: :key
    resources :processes, only: [:create, :update, :show] do
      collection do
        post :continue_later, to: 'processes#continue_later', as: 'continue_later'
      end
      member do
        put :continue_later, to: 'processes#continue_later'
        put 'forms/:form_id', to: 'processes#update', as: 'forms'
      end
    end
    resources :documents, only: :index
  end

end
