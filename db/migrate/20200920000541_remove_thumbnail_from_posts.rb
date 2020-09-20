class RemoveThumbnailFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :thumbnail, :string
  end
end
