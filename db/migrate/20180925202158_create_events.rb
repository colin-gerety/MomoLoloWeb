class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :start
      t.datetime :end
      t.string :title
      t.text :description
      t.references :event_image, foreign_key: true

      t.timestamps
    end
  end
end
