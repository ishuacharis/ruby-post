class RenameLocationToLocationIdUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :location, :location_id
  end
end
