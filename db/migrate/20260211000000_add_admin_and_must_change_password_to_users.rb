class AddAdminAndMustChangePasswordToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :admin, :boolean, default: false, null: false
    add_column :users, :must_change_password, :boolean, default: false, null: false
  end
end
