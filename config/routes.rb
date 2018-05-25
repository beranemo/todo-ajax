Rails.application.routes.draw do
  # For details on the DSL available within this file 
  # see http://guides.rubyonrails.org/routing.html
  
  resources :todos do
    member do
      post :toggle_check
    end
  end
  
  root 'todos#index'
  
  get "/jquery_on", to: "jquery#on"
  get "/jquery_ajax", to: "jquery#ajax"
  
end
