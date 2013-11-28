class AddStockToSizes < ActiveRecord::Migration
  def change
    add_column :sizes, :stock, :integer
  end
end
