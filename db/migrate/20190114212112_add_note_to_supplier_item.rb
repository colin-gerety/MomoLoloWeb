class AddNoteToSupplierItem < ActiveRecord::Migration[5.2]
  def change
    add_column :supplier_items, :note, :text
  end
end
