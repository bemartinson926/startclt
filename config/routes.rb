Rails.application.routes.draw do

  post 'add_user_to_group/:id' => 'groups#add_user_to_group', as: 'add_user_to_group'

  get '/first_group' => 'groups#first_group', as: 'first_group'
  get '/dashboard/group/:id', to: 'groups#group_dashboard', as: 'group_dashboard'
  get '/dashboard/group/:id/invite', to: 'groups#group_invite', as: 'group_invite'
  get '/dashboard/group/:id/events', to: 'groups#group_events', as: 'group_events'
  get '/dashboard/group/:id/members', to: 'groups#group_members', as: 'group_members'
  get '/popular_groups', to: 'groups#popular_groups', as: 'popular_groups'
  get '/group/:id', to: 'groups#group_info', as: 'group_info' 
  
  resources :groups, except: [:index] do
    resources :events
  end

  root to: 'welcome#home'
  get 'welcome/home'
  get '/about' => 'welcome#about'

  get '/dashboard/user/:id', to: 'users#user_dashboard', as: 'user_dashboard'
  get '/dashboard/user/:id/groups', to: 'users#user_groups', as: 'user_groups'
  get '/dashboard/user/:id/events', to: 'users#user_events', as: 'user_events'
  get '/dashboard/user/:id/profile', to: 'users#user_profile', as: 'user_profile'
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

end
