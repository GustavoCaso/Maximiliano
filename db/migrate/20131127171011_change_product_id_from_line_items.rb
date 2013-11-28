class ChangeProductIdFromLineItems < ActiveRecord::Migration
  def change
    rename_column :line_items, :product_id, :size_id
  end
end
