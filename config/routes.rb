Rails.application.routes.draw do
  root 'pages#index'

  resource :rsvps
end
