ActionController::Routing::Routes.draw do |map|

  map.resources :articles, :has_many => :comments
  map.devise_for :users
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
