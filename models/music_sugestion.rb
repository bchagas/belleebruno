class MusicSugestion < ActiveRecord::Base
  validates_presence_of :name, message: "Seu nome não pode ficar em branco"
  validates_presence_of :artist_name, message: "Nome do artista não pode ficar em branco"
  validates_presence_of :artist_song, message: "Nome da música não pode ficar em branco"
end
