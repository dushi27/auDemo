json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :app_id
  json.url comment_url(comment, format: :json)
end
