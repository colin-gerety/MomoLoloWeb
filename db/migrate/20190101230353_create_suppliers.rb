class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.text :order_info
      t.string :delivery_type
      t.string :payment_type
      t.text :notes
      t.boolean :maintains_stock

      t.timestamps
    end
  end
end
