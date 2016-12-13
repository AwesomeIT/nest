# frozen_string_literal: true
module Rest
  class Experiment < Base
  	def self.retrieve(id, user_credentials)
    	get(
        "#{name.demodulize.downcase}/#{id}",
        headers(user_credentials['token'])
      )
    end

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

		def self.samples(user_credentials, experiment_id, sample_ids)
			post(
				"#{name.demodulize.downcase}/#{experiment_id}/#{__method__}",
        sample_ids,
        headers(user_credentials['token']).merge('Content-Type' => 'application/json')
			)
		end
  end
end
