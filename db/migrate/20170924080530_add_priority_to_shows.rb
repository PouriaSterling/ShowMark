class AddPriorityToShows < ActiveRecord::Migration
  def change
    add_column :shows, :priority, :integer
  end
end
