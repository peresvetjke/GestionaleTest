class CreateCustomerAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :customer_addresses do |t|
      t.string :country
      t.string :province
      t.string :city
      t.string :postcode
      t.string :name
      t.references :user, null: false, foreign_key: { to_table: :customer_users }

      t.timestamps
    end
  end
end
