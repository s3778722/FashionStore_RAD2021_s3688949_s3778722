class RemoveTagsFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :tags, :text
  end
end
