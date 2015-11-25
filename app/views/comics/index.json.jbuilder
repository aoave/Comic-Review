# you don't need these, should be deleted
json.array!(@comics) do |comic|
  json.extract! comic, :id, :title, :desrciption
  json.url comic_url(comic, format: :json)
end
