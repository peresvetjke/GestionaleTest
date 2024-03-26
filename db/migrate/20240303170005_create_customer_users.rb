class CreateCustomerUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :customer_users do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
