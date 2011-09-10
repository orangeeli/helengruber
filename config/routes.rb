HelenGruber::Application.routes.draw do
  
  # model
  # get "work_pieces/index"
  resources :users
  resources :sections
  resources :work_graphics

  #match '/work_pieces/index/page/:page/section/:section_id' => 'work_piece#index'
  match '/work_pieces/section/:section_id/page/:page', :controller => 'work_pieces', :action => 'index'
  match '/work_pieces/section/:section_id', :controller => 'work_pieces', :action => 'index'
  match '/work_pieces/page/:page', :controller => 'work_pieces', :action => 'index'

  resources :work_pieces do
    get 'search', :on => :collection
    resources :work_graphics
  end

  # authentication paths
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sessions/new"
  resources :sessions

  # section and pagination paths for work pieces
  # match ':controller/section/:section_id' => 'work_piece#index'
  match ':controller/:action/:year/:month/:day' => 'work_piece#archive'

  # send user message
  match '/users/send_user_message' => 'users#send_user_message'

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
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
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
  #       get 'recent', :on => :collection
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
  root :to => "work_pieces#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
