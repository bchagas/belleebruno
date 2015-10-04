Rails.application.routes.draw do
  root 'pages#index'

  get  "/confirmacao-de-presenca", to: "rsvps#new"
  post :rsvps, to: "rsvps#create"

  get  "/indique-uma-musica", to: "music_indications#new", as: :music
  post :music_indications, to: "music_indications#create"

  get "/:page", to: "pages#show"
end
