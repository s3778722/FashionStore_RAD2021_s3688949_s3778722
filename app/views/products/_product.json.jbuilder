json.extract! product, :id, :title, :desc, :price, :date_stocked, :created_at, :updated_at, :popularity
json.url product_url(product, format: :json)
