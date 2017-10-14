Rails.application.routes.draw do
  defaults format: :json do
    resources :wcstatuses
  end
  mount Messenger::Engine, at: '/messenger'
end
