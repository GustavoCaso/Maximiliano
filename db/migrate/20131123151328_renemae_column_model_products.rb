class RenemaeColumnModelProducts < ActiveRecord::Migration
  def change
    rename_column :products, :model, :sub_category
  end
end
