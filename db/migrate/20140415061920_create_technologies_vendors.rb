class CreateTechnologiesVendors < ActiveRecord::Migration
  def change
    create_table :technologies_vendors do |t|
      t.references :vendor, index: true
      t.references :technology, index: true

      t.timestamps
    end
  end
end
