Rails.application.routes.draw do
  resources :products do
    post :position, on: :member
  end
end
