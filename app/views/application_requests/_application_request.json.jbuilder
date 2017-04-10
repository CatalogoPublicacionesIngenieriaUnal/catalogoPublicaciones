json.extract! application_request, :id, :state, :authorized_at, :created_at, :updated_at
json.url application_request_url(application_request, format: :json)
