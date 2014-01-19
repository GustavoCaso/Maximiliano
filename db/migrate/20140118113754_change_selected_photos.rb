class ChangeSelectedPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :selected
  end
end
