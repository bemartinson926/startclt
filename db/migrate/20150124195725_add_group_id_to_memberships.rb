class AddGroupIdToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :group_id, :integer
  end
end
