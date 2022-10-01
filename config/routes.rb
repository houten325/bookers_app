Rails.application.routes.draw do
  get '/top' => 'homes#top'
  get 'books/new'
  post 'books' => 'books#create'
  get 'books' => 'books#index'
  get 'books/:id' =>'books#show'
  get 'books/:id/edit' => 'books#edit', as: 'edit_books'
  patch 'books/:id' => 'books#update', as: 'update_books'
  delete 'books/:id' => 'books#delete', as: 'delete_books'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
