class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :name
      t.string :email
      t.integer :status
      t.boolean :guest, default: false
      t.string :guest_name

      t.timestamps null: false
    end
  end
end
