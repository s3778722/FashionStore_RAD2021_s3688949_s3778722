class AddRatedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rated, :boolean, default: false
  end
end
