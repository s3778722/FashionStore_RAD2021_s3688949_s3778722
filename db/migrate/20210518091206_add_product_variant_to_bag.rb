class AddProductVariantToBag < ActiveRecord::Migration[5.2]
  def change
    add_reference :bags, :product_variant, foreign_key: true
  end
end
