require	'httparty'
require 'json'

response = HTTParty.get('http://bbc.co.uk')
puts response.code
puts response.message