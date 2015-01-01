Rafflesia::Application.routes.draw do

  # root
  root 'home#index'

  # home
  resources :home, only: [:new, :create, :update]

  # xml
  get ":phone/data.xml" => "home#show", format: "xml"

  # Interface for destory action
  get "/delete" => "home#delete"
  post "/destory" => "home#destroy"

end
