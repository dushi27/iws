require 'json'
class ListnerController < ApplicationController
	def event_triggered	
		@secret = ENV.fetch('WHS', 'test secret')
		message = {response: params['challenge']}

		got_challenge = OpenSSL::HMAC.hexdigest("SHA256", @secret, message.to_json) 
		puts got_challenge
		puts "******************"
		response.headers['X-OUTBOUND-TOKEN'] = got_challenge



		render :json =>  message
	end

end

# 