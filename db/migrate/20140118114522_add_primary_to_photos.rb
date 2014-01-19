class AddPrimaryToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :primary, :boolean, default: true
  end
end
