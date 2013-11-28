class RemoveOutletFromSizes < ActiveRecord::Migration
  def change
    remove_column :sizes, :outlet
    add_column :products, :outlet, :boolean, default: false
  end
end
