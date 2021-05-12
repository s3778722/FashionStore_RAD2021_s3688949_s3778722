class ChangeSavedListsToFavourites < ActiveRecord::Migration[5.2]
  def change
    rename_table :saved_lists, :favourites
  end
end
