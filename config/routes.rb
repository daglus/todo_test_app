Rails.application.routes.draw do
  resources :tasks do
    member do
      post :complete
    end
    collection do
      delete :batch_delete
    end
  end

  devise_for :users
  root to: "home#index"
end
