json.extract! book, :id, :name, :cover_photos, :created_at, :updated_at
json.url book_url(book, format: :json)
json.cover_photos url_for(book.cover_photos)
