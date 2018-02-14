class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :phone
      t.string :web_site
      t.string :email

      t.timestamps
    end
  end
end
