# frozen_string_literal: true
module Rest
  class Experiment < Base
  	def self.list(user_credentials)
    	get(
        "#{name.demodulize.downcase}",
        headers(user_credentials['token'])
      )
    end

    def self.create(user_credentials, info)
  		put(
  			"#{name.demodulize.downcase}",
  			info.to_json,
  			headers(user_credentials['token']).merge('Content-Type' => 'application/json')
  		)
		end
  end
end
