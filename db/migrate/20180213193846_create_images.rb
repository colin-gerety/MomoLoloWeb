class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :image
      t.boolean :display_in_ui
      t.references :picturable, polymorphic: true

      t.timestamps
    end
  end
end
