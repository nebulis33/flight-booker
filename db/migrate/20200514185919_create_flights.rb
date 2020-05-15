class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.belongs_to :from_airport, class_name: "Airport"
      t.belongs_to :to_airport, class_name: "Airport"
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.float :flight_duration
      t.timestamps
    end
  end
end
