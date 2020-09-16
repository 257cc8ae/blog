class RemoveImgFromTags < ActiveRecord::Migration[6.0]
  def change
    remove_column :tags, :img, :string
  end
end
