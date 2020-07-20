class AddIndexAttendedEventId < ActiveRecord::Migration[6.0]
  def change
    add_index :invitations, :attended_event_id
  end
end
