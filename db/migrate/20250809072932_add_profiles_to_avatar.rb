class AddProfilesToAvatar < ActiveRecord::Migration[7.2]
  def change
    add_column :avatars, :avatar, :string
  end
end
