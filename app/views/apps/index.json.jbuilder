json.array!(@apps) do |app|
  json.extract! app, :id, :name, :skill, :video_link, :web_link, :price, :user_id
  json.url app_url(app, format: :json)
end
