require 'json'
class ListnerController < ApplicationController
	def event_triggered	
		@secret = ENV.fetch('WHS', 'test secret')
		message = '{"response" : #{param[:challenge]}}'

		got_challenge = OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), @secret, message)
	
		puts got_challenge
		puts "******************"
		response.headers['X-OUTBOUND-TOKEN'] = got_challenge



		render :json =>  {response: params['challenge']}
	end

end

# 