class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :group, null: false
      t.string :name
      t.text :description
      t.string :location
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
    add_foreign_key :events, :groups
  end
end
