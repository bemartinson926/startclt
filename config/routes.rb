Rails.application.routes.draw do
  root to: 'welcome#home'
  get '/about', to: 'welcome#about'

  post 'add_user_to_group/:id' => 'groups#add_user_to_group', as: 'add_user_to_group'
  post 'add_rsvp_to_event/:id' => 'events#add_rsvp_to_event', as: 'add_rsvp_to_event'
  delete 'remove_user_from_group/:id' => 'groups#remove_user_from_group', as: 'remove_user_from_group'

  # get '/dashboard/group/:id/invite', to: 'groups#group_invite', as: 'group_invite'
  # get '/dashboard/group/:id/events', to: 'groups#group_events', as: 'group_events'
  # get '/dashboard/group/:id/members', to: 'groups#group_members', as: 'group_members'
  
  get '/first_group' => 'groups#first_group', as: 'first_group'
  get '/groups/:id/dashboard', to: 'groups#group_dashboard', as: 'group_dashboard'
  get '/popular_groups', to: 'groups#popular_groups', as: 'popular_groups'

  resources :groups, except: [:index] do
    resources :events
  end

  get '/users/:id/profile', to: 'users#show', as: 'user_profile'
  get '/users/:id/dashboard', to: 'users#user_dashboard', as: 'user_dashboard'
  get '/users/:id/events', to: 'users#user_events', as: 'user_events'

  # get '/dashboard/user/:id', to: 'users#user_dashboard', as: 'user_dashboard'
  # get '/dashboard/user/:id/groups', to: 'users#user_groups', as: 'user_groups'
  # get '/dashboard/user/:id/events', to: 'users#user_events', as: 'user_events'
  # get '/dashboard/user/:id/profile', to: 'users#user_profile', as: 'user_profile'
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

end
