class CreateTestimonialsVendors < ActiveRecord::Migration
  def change
    create_table :testimonials_vendors do |t|
      t.references :vendor, index: true
      t.references :testimonial, index: true

      t.timestamps
    end
  end
end
