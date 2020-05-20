Rails.application.routes.draw do
	root :to => 'home#index'
	mount ShopifyApp::Engine, at: '/'
	post '/updateMinQuantity/:product_id', to: 'home#updateMinQuantity', :defaults => { :format => 'json' }
	get '/callback', to: 'home#callback'  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
