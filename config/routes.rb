Rails.application.routes.draw do

  namespace  :home do
    get :home_page
  end

  root 'home#home_page'
end
