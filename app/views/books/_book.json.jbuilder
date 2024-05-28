json.extract! book, :id, :description, :year, :pages, :created_at, :updated_at
json.url book_url(book, format: :json)
