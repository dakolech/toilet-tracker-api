Rails.application.routes.draw do
  defaults format: :json do
    resources :wcstatuses
  end
end
