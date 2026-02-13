class CreateOrganizationUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :organization_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end

    add_index :organization_users, [ :user_id, :organization_id ], unique: true
  end
end
