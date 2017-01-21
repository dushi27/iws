class ListnerController < ApplicationController
	def event_triggered	
		response.headers['X-OUTBOUND-TOKEN'] = 'HMAC-SHA256'
		# @secret = ENV.fetch('WHS', 'test secret')
		# render :json =>  {status: 200, type: 'verification', @secret}
		# {"type":"verification","challenge":"xxx"}
		render :json =>  params['challenge']
	end

end
