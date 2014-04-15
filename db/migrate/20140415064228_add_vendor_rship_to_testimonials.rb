class AddVendorRshipToTestimonials < ActiveRecord::Migration
  def change
    add_reference :testimonials, :vendor, index: true
  end
end
