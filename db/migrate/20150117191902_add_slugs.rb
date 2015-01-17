class AddSlugs < ActiveRecord::Migration
  def change
    add_column :groups, :slug, :string
    add_column :events, :slug, :string
  end
end
