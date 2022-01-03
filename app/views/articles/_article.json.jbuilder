json.extract! article, :id, :date, :shop_name, :bean_name, :producing_area, :particle_size, :memo, :photos, :want_to_again, :created_at, :updated_at
json.url article_url(article, format: :json)
json.photos url_for(article.photos)
