Rails.application.routes.draw do

     resources :topics
     resources :advertisements, :posts, :questions

     get 'about' => 'welcome#about'

     root 'welcome#index'
end
