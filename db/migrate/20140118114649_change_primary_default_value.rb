class ChangePrimaryDefaultValue < ActiveRecord::Migration
  def change
    change_column :photos, :primary, :boolean, default: false
  end
end
