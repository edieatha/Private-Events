class CreateCreatedEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :created_events do |t|

      t.timestamps
    end
  end
end
