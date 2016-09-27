json.extract! booking, :id
json.set! :resourceId , booking["room_id"]
timefrom = Time.parse(booking["timefrom"].to_s)
dtimefrom = booking["date"] + timefrom.seconds_since_midnight.seconds
timeto = Time.parse(booking["timeto"].to_s)
dtimeto = booking["date"] + timeto.seconds_since_midnight.seconds
json.set! :start , dtimefrom
json.set! :end , dtimeto
json.url booking_url(booking, format: :json)