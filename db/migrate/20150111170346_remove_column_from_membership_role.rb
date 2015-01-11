class RemoveColumnFromMembershipRole < ActiveRecord::Migration
  def change
    remove_column :membership_roles, :role, :string
  end
end
