class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :txn_id
      t.decimal :amount, precision: 6, scale: 2, default: 0
      t.integer :cart_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
