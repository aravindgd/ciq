class CreateServicesVendors < ActiveRecord::Migration
  def change
    create_table :services_vendors do |t|
      t.references :vendor, index: true
      t.references :service, index: true

      t.timestamps
    end
  end
end
