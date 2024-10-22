class CreateLivehouses < ActiveRecord::Migration[7.1]
  def change
    create_table :livehouses do |t|
      t.string :title
      t.string :address
      t.string :picture
      t.jsonb :hours
      t.integer :capacity
      t.string :website_url
      t.string :contact_email
      t.string :nearest_station
      t.string :event_calendar_url

      t.string :genres, array: true, default: []
      t.string :equipment, array: true, default: []

      t.timestamps
    end
  end
end
