class AddWebSiteToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :url, :string
  end
end
