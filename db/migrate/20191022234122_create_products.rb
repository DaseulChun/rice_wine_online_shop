class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 6, scale: 2, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
