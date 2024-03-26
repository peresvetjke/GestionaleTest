class CreateCustomerContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :customer_contacts do |t|
      t.string :fiscal_code
      t.string :email
      t.string :vat_number
      t.string :phone_number
      t.references :user, null: false, foreign_key: { to_table: :customer_users }

      t.timestamps
    end
  end
end
