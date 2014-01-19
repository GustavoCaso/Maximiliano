class RemovePrimaryFromProductAddToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :primary, :boolean, default: false
    remove_column :products, :primary, :integer
  end
end
