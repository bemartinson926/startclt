class AddColumnToMembershipRole < ActiveRecord::Migration
  def change
    add_column :membership_roles, :role, :integer, default: 0
  end
end
