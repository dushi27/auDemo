json.array!(@apps) do |app|
  json.extract! app, :id, :name, :catagory, :sub_catagory, :notes
  json.url app_url(app, format: :json)
end
