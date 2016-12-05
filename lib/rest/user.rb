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
  end
end
