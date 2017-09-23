class AddCategoryToShows < ActiveRecord::Migration
  def change
    add_column :shows, :category, :string
  end
end
