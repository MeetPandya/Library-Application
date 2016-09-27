json.extract! room, :id,:number
json.set! :id , room["number"]
json.url room_url(room, format: :json)