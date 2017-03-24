json.extract! attachment, :id, :url,, :type, :created_at, :updated_at
json.url attachment_url(attachment, format: :json)
