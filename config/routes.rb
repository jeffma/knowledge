Knowledge::Engine.routes.draw do
  get "pages/index" => "pages#index"

  get "/" =>  "pages#index"
end
