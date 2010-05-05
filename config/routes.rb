Flow::Application.routes.draw do |map|
  #
  # http://yehudakatz.com/2009/12/26/the-rails-3-router-rack-it-up/
  
  # basics
  # match "/foo", :to => proc {|env| [200, {}, ["Hello world"]] }
  # match "/main/:id", :to => "main#home"
  # match "/foo", :to => redirect("/bar")
  
  # method + named route
  # post "/main/:id", :to => "main#home", :as => :homepage

  # rack (sinatra)
  # match "/home", :to => SinatraApp
  
  # more
  # subdomain_routes plugin
  
  root :to => "entries#index"
  match 'login'  => 'sessions#new', :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout
  
  #
  # entries
  #
  rule = { :year => /(19|20)\d\d/, :month => /[01]\d/ }
  match "/entries/:year/:month/:slug", :to => "entries#show",
    :constraints => rule
  match "/entries(/:year(/:month(/:slug)))", :to => "entries#index",
    :constraints => rule
  
  resources :entries
  resource :session
  
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
