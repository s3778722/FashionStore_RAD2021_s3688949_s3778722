class CreateBags < ActiveRecord::Migration[5.2]
  def change
    create_table :bags do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
