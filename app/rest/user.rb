# frozen_string_literal: true
module Rest
  class User < Base
    def self.authenticate(params)
      post(
        "#{name.demodulize.downcase}/#{__method__}",
        params,
        headers
      )
    end

    def self.by_credentials(user_credentials)
      return unless user_credentials
    	get(
        "#{name.demodulize.downcase}/#{user_credentials['userId']}",
        headers(user_credentials['token'])
      )
    end
  end
end
