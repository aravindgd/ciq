json.array!(@works) do |work|
  json.extract! work, :id, :vendor_id, :screen_shot, :url, :title
  json.url work_url(work, format: :json)
end
