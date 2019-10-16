json.extract! recipe, :id, :user_id, :category_id, :name, :description, :preparation, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
