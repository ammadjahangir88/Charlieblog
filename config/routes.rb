Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/index'

  devise_for :users 

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'groups#index'


   
 
  
   resources :users do
  
     resources :groups do 
    
      resources :articles do 
        resources :comments do
          
        end
        
      end
     
      get 'join', to: 'groups#join'
      get 'joingroup', to: 'groups#joingroup'
      get 'view', to: 'groups#view'
      get 'approve', to: 'groups#approve'
      get 'accept', to: 'groups#accept'
      get 'delete', to: 'groups#delete'
    end

      get  'changeplan', to: 'users#changeplan'
   end
 

    
   

   
end
