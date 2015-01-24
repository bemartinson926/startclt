class RemoveGroupIdColumnFromMembership < ActiveRecord::Migration
  def change
    remove_column :memberships, :group_id, :integer
  end
end
