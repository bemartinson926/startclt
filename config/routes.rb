Rails.application.routes.draw do

  get '/new_group' => 'groups#new_group', as: 'first_group'
  get '/dashboard/:id', to: 'groups#group_dashboard', as: 'group_dashboard'
  
  resources :groups do
    resources :events
  end

  root to: 'welcome#home'
  get 'welcome/home'
  get '/about' => 'welcome#about'

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

end
