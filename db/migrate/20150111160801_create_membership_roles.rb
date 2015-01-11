class CreateMembershipRoles < ActiveRecord::Migration
  def change
    create_table :membership_roles do |t|
      t.string :role, default: 'member'
      t.references :membership

      t.timestamps
    end
    add_foreign_key :membership_roles, :memberships
  end
end
