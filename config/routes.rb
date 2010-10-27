ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'articles', :action => 'index'
  map.resources :articles, :has_many => :comments
  map.devise_for :users
  map.hire 'projects/', :controller => 'pages', :action => 'projects'
  map.ben 'ben/', :controller => 'pages', :action => 'ben'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
