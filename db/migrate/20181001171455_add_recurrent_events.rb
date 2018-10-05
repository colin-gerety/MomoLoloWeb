class AddRecurrentEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :recurrent, :boolean
    add_column :events, :recurrence_description, :string
    add_column :events, :recurrence_days, :integer
  end
end

