class CreateServicesWorks < ActiveRecord::Migration
  def change
    create_table :services_works do |t|
      t.references :service, index: true
      t.references :work, index: true

      t.timestamps
    end
  end
end
