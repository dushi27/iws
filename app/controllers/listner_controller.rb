require 'json'
class ListnerController < ApplicationController
	def event_triggered	
		@secret = ENV.fetch('WHS', 'test secret')
		got_challenge = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), @secret, params['challenge'])).gsub("\n",'').strip()
		puts got_challenge
		puts "******************"
		response.headers['X-OUTBOUND-TOKEN'] = got_challenge

		
		# render :json =>  {status: 200, type: 'verification', @secret}
		# {"type":"verification","challenge":"xxx"}
		# information = request.raw_post
		# data_parsed = JSON.parse(information)
		# raise response.body.inspect

		render :json =>  {response: params['challenge']}
	end

end

# 