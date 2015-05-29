json.array!(@messages) do |message|
  json.extract! message, :id, :content, :author, :topic
  json.url message_url(message, format: :json)
end
