json.extract! waste_info, :id, :category, :true_category, :weight, :notes, :anomaly, :timestamp, :active, :area_id, :material_type_id, :created_at, :updated_at
json.url waste_info_url(waste_info, format: :json)
