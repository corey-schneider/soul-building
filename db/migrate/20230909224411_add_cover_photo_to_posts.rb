class AddCoverPhotoToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :cover_photo_id, :integer
  end
end
