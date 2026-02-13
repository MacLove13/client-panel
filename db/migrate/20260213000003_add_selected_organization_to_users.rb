class AddSelectedOrganizationToUsers < ActiveRecord::Migration[8.1]
  def change
    add_reference :users, :selected_organization, foreign_key: { to_table: :organizations }, null: true
  end
end
