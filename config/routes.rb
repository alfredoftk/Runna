Rails.application.routes.draw do

  devise_for :tenant_users

  namespace :v1 do
    resources :sessions, only: :create do
      collection do
        put :refresh_token
        delete :destroy, path: ""
      end
    end
  end

end
