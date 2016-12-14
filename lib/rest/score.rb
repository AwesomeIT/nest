# frozen_string_literal: true
module Rest
  class Score < Base
    def self.create(user_credentials, score)
      put(
        "#{name.demodulize.downcase}",
        score.merge('user_id' => user_credentials['userId']).to_json,
        headers(user_credentials['token']).merge('Content-Type' => 'application/json')
      )
    end
  end
end
