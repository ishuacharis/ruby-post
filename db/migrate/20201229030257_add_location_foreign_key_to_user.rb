class AddLocationForeignKeyToUser < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users, :locations, null: false, default: 1
  end
end
