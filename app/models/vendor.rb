class Vendor < ActiveRecord::Base
	has_many :works
	has_and_belongs_to_many :technologies
	has_and_belongs_to_many :services
	has_and_belongs_to_many :testimonials
end
