class AddNotificationsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :display_notify, :boolean, default: false
    add_column :events, :display_event, :boolean, default: true
    add_column :events, :notify_title, :string
    add_column :events, :notify_start, :datetime
    add_column :events, :notify_end, :datetime
  end
end

