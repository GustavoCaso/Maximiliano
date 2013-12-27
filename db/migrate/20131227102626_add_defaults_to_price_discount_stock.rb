class AddDefaultsToPriceDiscountStock < ActiveRecord::Migration
  def change
    change_column :sizes, :price, :float, default: 0.0
    change_column :sizes, :discount, :integer, default: 0
    change_column :sizes, :stock, :integer, default: 0
  end
end
