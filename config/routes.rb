Rails.application.routes.draw do
  root "artists#index"

  resources :songs

  get "/songs/play/:id", to: "songs#play_song", as: "play_song"
  get "/top10songs", to: "songs#top_10_songs", as: "top10_songs"

  resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
