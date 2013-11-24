json.array!(@sizes) do |size|
  json.extract! size, :product_id, :size, :price
  json.url size_url(size, format: :json)
end
