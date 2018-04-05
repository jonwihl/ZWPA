json.array!(@clients) do |client|
    json.extract! client, :id, :name, :street_1, :street_2, :city, :state, :zip, :contact_phone, :contact_email, :contact_title, :contact_first_name, :contact_last_name, :active
    json.url client_url(client, format: :json)
end
