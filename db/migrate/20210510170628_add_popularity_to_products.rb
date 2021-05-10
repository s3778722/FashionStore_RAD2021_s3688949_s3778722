class AddPopularityToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :popularity, :integer
  end
end
