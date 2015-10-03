class MusicIndication < ActiveRecord::Base
  validates :song_name, :song_artist, presence: true
end
