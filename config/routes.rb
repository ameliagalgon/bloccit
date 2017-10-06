Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

<<<<<<< HEAD
  get 'welcome/contact'
=======
  get 'welcome/faq'
>>>>>>> assignment-12-testing

  root 'welcome#index'
end
