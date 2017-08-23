require 'api_constraints'

Rails.application.routes.draw do

  scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
    resources :sessions, only: :create do
      collection do
        put :refresh_token
        delete :destroy, path: ""
      end
    end
  end

end
