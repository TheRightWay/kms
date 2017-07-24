Rails.application.routes.draw do
  namespace :kms do
    constraints(format: "json") do
      resources :pages, format: true do
        collection do
          post 'sorting'
        end
      end
      resources :templates, except: [:new, :edit], format: true
      resources :snippets, except: [:new, :edit], format: true
      resources :users, only: [:index, :destroy], format: true do
        post :from_kms, on: :collection, action: :create
        get :kms_user, on: :collection
      end
    end
  end
end
