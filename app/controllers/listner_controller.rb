require 'json'
class ListnerController < ApplicationController
	def event_triggered	
		response.headers['X-OUTBOUND-TOKEN'] = 'HMAC-SHA256'
		# @secret = ENV.fetch('WHS', 'test secret')
		# render :json =>  {status: 200, type: 'verification', @secret}
		# {"type":"verification","challenge":"xxx"}
		# information = request.raw_post
		# data_parsed = JSON.parse(information)
		# raise response.body.inspect
		raise params['challenge'].inspect
		render :json =>  params['challenge']
	end

end

# 