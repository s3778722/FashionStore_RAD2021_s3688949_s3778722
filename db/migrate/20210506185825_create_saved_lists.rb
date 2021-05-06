class CreateSavedLists < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_lists do |t|
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
