json.extract! author, :id, :name, :address, :profile_picture, :created_at, :updated_at
json.url author_url(author, format: :json)
json.profile_picture url_for(author.profile_picture)
