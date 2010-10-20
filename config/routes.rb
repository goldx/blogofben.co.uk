ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'articles', :action => 'index'
  map.resources :articles, :has_many => :comments
  map.devise_for :users
  map.hire 'for_hire/', :controller => 'pages', :action => 'for_hire'
  map.ben 'ben/', :controller => 'pages', :action => 'ben'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
