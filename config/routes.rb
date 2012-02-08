Pastebin::Application.routes.draw do


  get 'pastes/my' => 'pastes#index', :as => :my_pastes
  resources :pastes
  root :to => 'pastes#new'
  devise_for :users

=begin
  scope "p" do
    post '/' => "pastes#create"
    get  '/new' => "pastes#new"
    get  '/:id/edit' => "pastes#edit"
    get  '/:id' => "pastes#show"
    put  '/:id' => "pastes#update"
    delete '/:id' => "pastes#destroy"
  end
=end

#                  pastes GET    /p(.:format)                   {:action=>"index", :controller=>"pastes"}
#                         POST   /p(.:format)                   {:action=>"create", :controller=>"pastes"}
#               new_paste GET    /p/new(.:format)               {:action=>"new", :controller=>"pastes"}
#              edit_paste GET    /p/:id/edit(.:format)          {:action=>"edit", :controller=>"pastes"}
#                   paste GET    /p/:id(.:format)               {:action=>"show", :controller=>"pastes"}
#                         PUT    /p/:id(.:format)               {:action=>"update", :controller=>"pastes"}
#                         DELETE /p/:id(.:format)               {:action=>"destroy", :controller=>"pastes"}
#                    root        /                              {:controller=>"pastes", :action=>"new"}

  
end
