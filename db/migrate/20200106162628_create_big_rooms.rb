class CreateBigRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :big_rooms do |t|
      t.integer :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :bookable
      t.string :booked
      t.string :category

      t.timestamps
    end
  end
end
