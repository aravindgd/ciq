json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :company, :website, :no_of_employees, :year_of_founding, :first_name, :last_name, :display_name, :phone, :logo, :git_link
  json.url vendor_url(vendor, format: :json)
end
