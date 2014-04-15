class AddLeftOutStuffToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :is_featured, :boolean, default: false
  end
end
