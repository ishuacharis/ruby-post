class AddFullNameBioLocationToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fullname, :string, null: false, default: 'fullname'
    add_column :users, :bio, :text, null: false, default: 'bio'
    add_column :users, :location, :integer, null: false, default: 1
  end
end
