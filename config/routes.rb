Agenda3::Application.routes.draw do

  resources :consultas do 
    as_routes
  end

  match 'relatorio_de_consultas', :to => 'consultas#relatorio_geral_de_consultas'

  match 'exibir_relatorio', :to => 'consultas#exibir_relatorio'

  resources :consultas_diarias do as_routes end

  resources :consultas_json do as_routes end

  resources :atendentes do as_routes end

  devise_for :usuarios do
    match 'usuarios/sign_out', :to => "devise/sessions#destroy"
  end

  resources :cargos do as_routes end

  resources :pessoas do as_routes end

  resources :locais do as_routes end

  resources :convenios do as_routes end

  resources :cidades do as_routes end

  resources :estados do 
    as_routes 
  end

  root :to => 'consultas_diarias#index'
  
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
