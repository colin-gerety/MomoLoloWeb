class CreateBaristas < ActiveRecord::Migration[5.2]
  def change
    create_table :baristas do |t|
      t.string :first
      t.string :last
      t.boolean :currently_working

      t.timestamps
    end
  end
end
