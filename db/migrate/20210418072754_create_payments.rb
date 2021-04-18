class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.integer :payment_method_id
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
