Rails.application.routes.draw do
  resources :books
  get 'books/new'
  root to: 'books#index'

  post 'books' => 'books#create'
  get '/books'=> 'books#index'
  get '/books/:id/show'=> 'books#show', as: 'show_book'
   get '/books/:id/result'=> 'books#result', as:'result_book'
  get '/bookd/:id/edit'=>'books#edit'
  patch '/books/:id' => 'books#update', as:'update_book'
  get '/books/:id/effect'=> 'books#effect', as:'effect_book'
delete'/books/:id' =>'books#destroy', as: 'destroy_book'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
