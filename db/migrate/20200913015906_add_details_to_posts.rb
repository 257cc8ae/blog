class AddDetailsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :name, :string
    add_column :posts, :thumbnail, :string
  end
end
