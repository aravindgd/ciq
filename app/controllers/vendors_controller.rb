class VendorsController < ApplicationController

  # GET /vendors
  # GET /vendors.json
  def index
    @vendors = Vendor.all
  end

end
