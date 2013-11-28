class AddOutletToSizes < ActiveRecord::Migration
  def change
    add_column :sizes, :outlet, :boolean, default: false
  end
end
