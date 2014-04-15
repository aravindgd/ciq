class HomeController < ApplicationController
	def index
		@vendor_list_for_enterprise = get_vendor_list("Enterprise")
		@vendor_list_for_b2b =  get_vendor_list("B2B")
		Rails.logger.info @vendor_list_for_enterprise
		Rails.logger.info @vendor_list_for_b2b
	end

	private

	def get_vendor_list(word_to_search)
		vendor = Hash.new
		Vendor.all.each do |v|
			testi_word_count = 0
			service_word_count = 0
			title_word_count = 0
			v.testimonials.each do |testi|
				testi_word_count += testi.content.scan(/#{word_to_search}/).count
				Rails.logger.info "testi_word_count"
				Rails.logger.info testi_word_count
			end
			v.services.each do |service|
				service_word_count += service.name.scan(/#{word_to_search}/).count
				Rails.logger.info "service_word_count"
				Rails.logger.info service_word_count
			end
			v.works.each do |work|
				title_word_count += work.title.scan(/#{word_to_search}/).count
				Rails.logger.info "title_word_count"
				Rails.logger.info title_word_count
			end
			vendor[v]=testi_word_count + service_word_count + title_word_count
		end
		Hash[vendor.sort_by{|k, v| [v,check_for_views(k,v,k.next,v.next)] }.reverse]
	end

	def check_for_views(k1,v1,k2,v2)
		if k1.works.sum(:number_of_views) > k2.works.sum(:number_of_views)
			v1
		else
			v2
		end
	end
end
