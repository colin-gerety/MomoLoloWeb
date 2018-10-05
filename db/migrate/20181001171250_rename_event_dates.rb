class RenameEventDates < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :start, :event_start
    rename_column :events, :end, :event_end
  end
end

