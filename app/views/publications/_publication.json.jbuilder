json.extract! publication, :id, :abstract, :theme, :category, :created_at, :updated_at
json.url publication_url(publication, format: :json)
