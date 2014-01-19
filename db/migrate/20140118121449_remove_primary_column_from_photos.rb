class RemovePrimaryColumnFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :primary
    add_column :products, :primary, :integer, default: 0
  end
end
