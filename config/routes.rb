Rails.application.routes.draw do

     resources :advertisements, :questions

     resources :topics do
          resources :posts, except: [:index]
          resources :sponsored_posts
     end

     resources :posts, only: [] do
          resources :comments, only: [:create, :destroy]
          resources :favorites, only: [:create, :destroy]
          post '/up-vote' => 'votes#up_vote', as: :up_vote
          post '/down-vote' => 'votes#down_vote', as: :down_vote
     end

     #resources :users, only: [:new, :create, :confirm]
     resources :users, :only => [:new, :create, :show] do
          collection do
               post 'confirm'
          end
     end

     resources :sessions, only: [:new, :create, :destroy]

     get 'about' => 'welcome#about'

     root 'welcome#index'
end
