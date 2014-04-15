class HomeController < ApplicationController
	def index
		Rails.logger.info "*******************************"
		Rails.logger.info "Enterprise"
		Rails.logger.info "*******************************"
		@vendor_list_for_enterprise = get_vendor_list("Enterprise")
		Rails.logger.info "*******************************"
		Rails.logger.info "B2B"
		Rails.logger.info "*******************************"

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
				testi_word_count += testi.content.scan(/#{word_to_search}/i).count
				Rails.logger.info "*******************************"
				Rails.logger.info "testi_word_count"
				Rails.logger.info testi_word_count
				Rails.logger.info "*******************************"
			end
			v.services.each do |service|
				service_word_count += service.name.scan(/#{word_to_search}/i).count
				Rails.logger.info "*******************************"
				Rails.logger.info "service_word_count"
				Rails.logger.info service_word_count
				Rails.logger.info "*******************************"
			end
			v.works.each do |work|
				title_word_count += work.title.scan(/#{word_to_search}/i).count
				Rails.logger.info "*******************************"
				Rails.logger.info "title_word_count"
				Rails.logger.info title_word_count
				Rails.logger.info "*******************************"
			end
			sum_of_counts = testi_word_count + service_word_count + title_word_count
			Rails.logger.info "*******************************"
			Rails.logger.info "sum_of_counts"
			Rails.logger.info sum_of_counts
			Rails.logger.info "*******************************"
			if sum_of_counts!=0
				vendor[v] = sum_of_counts
			end
		end
		Hash[vendor.sort_by{|k, v| [v,k.works.sum(:number_of_views)] }.reverse].keys.take(4)
	end
end
