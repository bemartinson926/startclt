json.array!(@events) do |event|
  json.extract! event, :id, :group_id, :name, :description, :location, :starts_at, :ends_at
  json.url event_url(event, format: :json)
end
