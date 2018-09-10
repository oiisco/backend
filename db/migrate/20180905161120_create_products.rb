class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :code
      t.integer :amount
      t.time :created_at

      t.timestamps
    end
  end
end
