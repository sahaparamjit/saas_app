Rails.application.routes.draw do
    root to: 'pages#home'
    get 'about', to: 'pages#about', as: 'aboutus'
    resources :contacts, only: :create
    get 'contact-us', to: 'contacts#new', as: 'new_contact'
end
