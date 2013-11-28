class AddPositionToSizes < ActiveRecord::Migration
  def change
    add_column :sizes, :position, :integer
  end
end
