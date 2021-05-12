class AddProductToFavourites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favourites, :product, foreign_key: true
  end
end
