json.array!(@audits) do |audit|
  json.extract! audit, :id, :name, :type, :start_date, :end_date, :active, :references, :references, :references
  json.url audit_url(audit, format: :json)
end
