json.array!(@events) do |event|
  json.extract! event, :start_time, :venue, :title
  json.url event_url(event, format: :json)
end
