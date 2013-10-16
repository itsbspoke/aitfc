json.array!(@stories) do |story|
  json.extract! story, :body, :user_id
  json.url story_url(story, format: :json)
end
