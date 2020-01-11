json.extract! big_room, :id, :name, :start_time, :end_time, :bookable, :booked, :category, :created_at, :updated_at
json.url big_room_url(big_room, format: :json)
