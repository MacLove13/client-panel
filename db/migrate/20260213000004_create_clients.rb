class CreateClients < ActiveRecord::Migration[8.1]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :phone
      t.string :address
      t.string :nickname
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
