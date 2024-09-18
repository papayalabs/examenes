json.extract! answer, :id, :description, :is_correct, :created_at, :updated_at
json.url answer_url(answer, format: :json)
