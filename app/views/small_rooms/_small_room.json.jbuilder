json.extract! small_room, :id, :name, :start_time, :end_time, :bookable, :booked, :category_id, :booking_person, :booking_reason, :created_at, :updated_at
json.url small_room_url(small_room, format: :json)
