class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :user, null: false
      t.references :group, null: false

      t.timestamps
    end
    add_foreign_key :memberships, :users
    add_foreign_key :memberships, :groups
  end
end
