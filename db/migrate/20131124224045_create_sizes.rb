class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.integer :product_id
      t.string :size
      t.float :price

      t.timestamps
    end
  end
end
