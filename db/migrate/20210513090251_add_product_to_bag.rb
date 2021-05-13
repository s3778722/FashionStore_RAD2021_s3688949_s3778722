class AddProductToBag < ActiveRecord::Migration[5.2]
  def change
    add_reference :bags, :product, foreign_key: true
  end
end
