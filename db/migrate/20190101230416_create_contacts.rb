class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :contact_type
      t.string :phone
      t.string :email
      t.text :address
      t.text :notes
      t.belongs_to :supplier, foreign_key: true

      t.timestamps
    end
  end
end
