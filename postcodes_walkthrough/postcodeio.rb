require 'httparty'
require 'json'

class Postcodesio
	include HTTParty

	attr_accessor :single_postcode_results

	base_uri 'https://api.postcodes.io/'

	def single_postcode_search postcode
		@single_postcode_results = self.class.get("/postcodes/#{postcode}")
		puts JSON.parse(@single_postcode_results.body)
	end

	def multiple_postcodes_search postdata
		@post_stuff = self.class.post("/postcodes", body: {'postcodes': postdata})
		puts JSON.parse(@post_stuff.body)
	end

end

pc = Postcodesio.new
# pc.single_postcode_search 'SW65BW'
pc.multiple_postcodes_search ['SW65BW', 'SW139NL']