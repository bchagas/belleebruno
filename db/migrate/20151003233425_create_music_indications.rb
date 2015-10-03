class CreateMusicIndications < ActiveRecord::Migration
  def change
    create_table :music_indications do |t|
      t.string :song_name
      t.string :song_artist

      t.timestamps null: false
    end
  end
end
