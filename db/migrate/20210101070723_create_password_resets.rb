class CreatePasswordResets < ActiveRecord::Migration[6.0]
  def change
    create_table :password_resets do |t|
      t.string :email, null: false, index: true
      t.string :token, null: false
      t.timestamps
    end
  end
end
