require 'json'
class ListnerController < ApplicationController
	def event_triggered	
		@secret = ENV.fetch('WHS', 'test secret')
		response.headers['X-OUTBOUND-TOKEN'] = @secret
		
		# render :json =>  {status: 200, type: 'verification', @secret}
		# {"type":"verification","challenge":"xxx"}
		# information = request.raw_post
		# data_parsed = JSON.parse(information)
		# raise response.body.inspect
		render :json =>  params['challenge']
	end

end

# 