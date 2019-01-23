class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.string :name
      t.string :category
      t.string :item_id
      t.text :description

      t.timestamps
    end
  end
end
