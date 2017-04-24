json.extract! professor, :id, :username, :first_name, :last_name, :email, :department, :contact_number, :gender, :is_authorized, :created_at, :updated_at
json.url professor_url(professor, format: :json)
