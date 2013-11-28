class AddDiscountToSizes < ActiveRecord::Migration
  def change
    add_column :sizes, :discount, :integer
  end
end
