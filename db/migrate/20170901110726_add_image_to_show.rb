class AddImageToShow < ActiveRecord::Migration
  def change
    add_column :shows, :image, :string
  end
end
