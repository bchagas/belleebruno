class CreateRsvp < ActiveRecord::Migration
  def up
    create_table :rsvps do |t|
      t.string :name
      t.string :email
      t.integer :status
      t.timestamps
    end
  end

  def down
    drop_table :rsvp
  end
end
