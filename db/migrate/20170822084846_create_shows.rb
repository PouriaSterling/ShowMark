class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.integer :season
      t.integer :episode

      t.timestamps null: false
    end
  end
end
