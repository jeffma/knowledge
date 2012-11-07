Knowledge::Engine.routes.draw do

  get "pages/index" => "pages#index"
  post "pages/new" => "pages#new"
  get "pages/*page/edit" => "pages#edit"
  post "pages/*page/update" => "pages#update"
  get "pages/*page" => "pages#show"
  get 'pages/preview' => 'pages#preview'
  post 'pages/preview' => 'pages#preview'

  get "/" =>  "pages#index"
end
