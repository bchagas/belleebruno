class CreateMusicSugestion < ActiveRecord::Migration
  def up
    create_table :music_sugestions do |t|
      t.string :name
      t.string :artist_name
      t.string :artist_song
      t.timestamps
    end
  end

  def down
    drop_table :music_sugestions
  end
end
