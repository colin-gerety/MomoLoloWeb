class AddTagLineToBarista < ActiveRecord::Migration[5.2]
  def change
    add_column :baristas, :tag_line, :string
  end
end
