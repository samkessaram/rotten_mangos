class RenamePosterImageUrl < ActiveRecord::Migration
  def change
    rename_column :movies, :poster_image_url, :url
  end
end
