class AddPayerIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :payer_id, :string
  end
end
