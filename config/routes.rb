Rails.application.routes.draw do
  root 'pages#index'

  get  "/confirmacao-de-presenca", to: "rsvps#new"
  post :rsvps, to: "rsvps#create"
end
