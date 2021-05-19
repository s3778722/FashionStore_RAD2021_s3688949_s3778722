class AddPurchasedToBags < ActiveRecord::Migration[5.2]
  def change
    add_column :bags, :purchased, :boolean, default: false
  end
end
