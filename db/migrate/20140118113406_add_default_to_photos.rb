class AddDefaultToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :selected, :integer, default: 0
  end
end
