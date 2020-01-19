json.extract! big_room, :id, :name, :start_time, :end_time, :bookable, :booked, :category_id, :booking_person, :booking_reason, :created_at, :updated_at
json.url big_room_url(big_room, format: :json)
