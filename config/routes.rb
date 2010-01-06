ActionController::Routing::Routes.draw do |map|
  map.resources :sites
  map.root :controller => 'sites'
  map.connect '/:name/', :controller => 'sites', :action => 'show'
end
