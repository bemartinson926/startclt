class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.references :user, null: false
      t.references :event, null: false
      t.integer :guest_count, default: 0
      t.integer :is_attending, default: 0 # [ 0, 1, 2, 3 ] == 'invited', 'yes', 'no', 'maybe' (found in model)

      t.timestamps
    end
    add_foreign_key :rsvps, :users
    add_foreign_key :rsvps, :events
  end
end
