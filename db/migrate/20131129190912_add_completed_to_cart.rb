class AddCompletedToCart < ActiveRecord::Migration
  def change
    add_column :carts, :completed, :boolean, default: false
  end
end
