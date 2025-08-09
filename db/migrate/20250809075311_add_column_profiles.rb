class AddColumnProfiles < ActiveRecord::Migration[7.2]
  def up
    add_column :profiles, :avataor, :string
  end

  def down
    remove_column :profiles, :avatar, :string
  end
end
