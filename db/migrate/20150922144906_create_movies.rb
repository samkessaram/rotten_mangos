class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.integer :runtime_in_minutes
      t.text :description
      t.string :url
      t.datetime :release_date

      t.timestamps null: false
    end
  end
end
