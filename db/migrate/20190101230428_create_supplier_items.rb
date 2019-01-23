class CreateSupplierItems < ActiveRecord::Migration[5.2]
  def change
    create_table :supplier_items do |t|
      t.integer :supplier_id
      t.integer :order_item_id
      t.integer :rank, default: 1

      t.timestamps
    end
  end
end
