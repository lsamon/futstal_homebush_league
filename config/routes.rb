# == Route Map
#
#        Prefix Verb   URI Pattern                   Controller#Action
#          root GET    /                             pages#home
#   edit_player GET    /players/edit(.:format)       players#edit
#       players GET    /players(.:format)            players#index
#               POST   /players(.:format)            players#create
#    new_player GET    /players/new(.:format)        players#new
#               GET    /players/:id/edit(.:format)   players#edit
#        player GET    /players/:id(.:format)        players#show
#               PATCH  /players/:id(.:format)        players#update
#               PUT    /players/:id(.:format)        players#update
#         teams GET    /teams(.:format)              teams#index
#               POST   /teams(.:format)              teams#create
#      new_team GET    /teams/new(.:format)          teams#new
#     edit_team GET    /teams/:id/edit(.:format)     teams#edit
#          team GET    /teams/:id(.:format)          teams#show
#               PATCH  /teams/:id(.:format)          teams#update
#               PUT    /teams/:id(.:format)          teams#update
#               DELETE /teams/:id(.:format)          teams#destroy
#     divisions GET    /divisions(.:format)          divisions#index
#               POST   /divisions(.:format)          divisions#create
#  new_division GET    /divisions/new(.:format)      divisions#new
# edit_division GET    /divisions/:id/edit(.:format) divisions#edit
#      division GET    /divisions/:id(.:format)      divisions#show
#               PATCH  /divisions/:id(.:format)      divisions#update
#               PUT    /divisions/:id(.:format)      divisions#update
#               DELETE /divisions/:id(.:format)      divisions#destroy
#         games GET    /games(.:format)              games#index
#               POST   /games(.:format)              games#create
#      new_game GET    /games/new(.:format)          games#new
#     edit_game GET    /games/:id/edit(.:format)     games#edit
#          game GET    /games/:id(.:format)          games#show
#               PATCH  /games/:id(.:format)          games#update
#               PUT    /games/:id(.:format)          games#update
#               DELETE /games/:id(.:format)          games#destroy
#         login GET    /login(.:format)              session#new
#               POST   /login(.:format)              session#create
#               DELETE /login(.:format)              session#destroy
#

Rails.application.routes.draw do

  root :to => 'pages#home'
  get '/players/edit' => 'players#edit', :as => 'edit_player'

  delete '/games/:id' => 'games#destroy', :as => 'delete_game'
  get '/games/fixtures' => 'games#fixtures'
  get '/games/results' => 'games#results'

  resources :players, :only => [:index, :new, :create, :show, :edit, :update]
  resources :teams
  resources :divisions
  resources :games, :except => [:destroy]
  resources :articles

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
