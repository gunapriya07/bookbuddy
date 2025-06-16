class AddFavoriteToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :favorite, :boolean
  end
end
