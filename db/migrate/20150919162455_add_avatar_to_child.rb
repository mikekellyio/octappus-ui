class AddAvatarToChild < ActiveRecord::Migration
  def change
    add_column :children, :avatar_hash, :string
  end
end
