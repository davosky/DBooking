class CreateMeetingRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :meeting_rooms do |t|
      t.integer :code
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
