class CreateSmallRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :small_rooms do |t|
      t.integer :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :bookable
      t.string :booked
      t.string :booking_person
      t.string :booking_reason
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
