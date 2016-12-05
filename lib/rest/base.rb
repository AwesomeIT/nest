# frozen_string_literal: true
require 'rest_client'

module Rest
  class Base
    BASE_URL = ENV['API_BASE_URL'] || 'http://talkbirdy.herokuapp.com/v1/'

    def self.headers(access_token = nil)
      {
        'Chirp-Api-Key' => ENV['API_KEY'] || '157bb342-9596-4d84-9872-e292f0b16d05',
        'Chirp-Access-Token' => access_token
      }
    end

    def self.post(route, params, headers)
      RestClient.post("#{BASE_URL}#{route}",
                      params.to_json,
                      headers.merge('Content-Type' => 'application/json')) { |response| response }
    end
  end
end
