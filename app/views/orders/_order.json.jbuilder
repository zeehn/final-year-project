json.extract! order, :id, :schedule_date, :time_from, :time_to, :instructions, :client_id, :maid_id, :created_at, :updated_at
json.url order_url(order, format: :json)
