class AddUserIdToShows < ActiveRecord::Migration
  def change
    add_reference :shows, :user, index: true, foreign_key: true
  end
end
