class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :author
      t.text :quote_html
      t.string :date

      t.timestamps
    end
  end
end
