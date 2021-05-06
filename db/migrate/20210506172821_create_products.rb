class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :desc
      t.decimal :price
      t.date :date_stocked
      t.text :tags

      t.timestamps
    end
  end
end
