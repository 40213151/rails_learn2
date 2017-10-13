Rails.application.routes.draw do
  post "ines/:post_id/create" => "ines#create"
  post "ines/:post_id/destroy" => "ines#destroy"
  
  post "yosakoiyers/:id/update" => "yosakoiyers#update"
  get "yosakoiyers/:id/edit" => "yosakoiyers#edit"
  post "yosakoiyers/create" => "yosakoiyers#create"
  get "signup" => "yosakoiyers#new"
  get 'yosakoiyers/index' => "yosakoiyers#index"
  get "yosakoiyers/:id" => "yosakoiyers#show"
  get "yosakoiyers/:id/ines" => "yosakoiyers#ines"
  
  get "login" => "yosakoiyers#login_form"
  post "login" => "yosakoiyers#login"
  
  post "logout" => "yosakoiyers#logout"
  
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  
  get "/" => "home#top"
  get "about" => "home#about"
end
