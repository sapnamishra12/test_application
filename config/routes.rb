Rails.application.routes.draw do
  root to: "item_categories#index"
  resources :item_taxes
  resources :items do
  	collection do
  		get :get_selected_items
  	end
  end
  resources :item_categories do
  	collection do
  		get :get_items
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
