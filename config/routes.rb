Rails.application.routes.draw do

  namespace  :home do
    get :home_page
    get :proxy_details
  end

  root 'home#home_page'
end
