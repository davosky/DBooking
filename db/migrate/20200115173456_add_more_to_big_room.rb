class AddMoreToBigRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :big_rooms, :booking_person, :string
    add_column :big_rooms, :booking_reason, :string
    add_reference :big_rooms, :category, foreign_key: true
  end
end
