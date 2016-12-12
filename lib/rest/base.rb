# frozen_string_literal: true
require 'rest_client'

module Rest
  class Base
    BASE_URL = ENV['API_BASE_URL']

    def self.headers(access_token = nil)
      base_headers = { 'Chirp-Api-Key' => ENV['API_KEY'] }

      base_headers.merge!(
        'Chirp-Access-Token' => access_token
      ) if access_token.present?

      base_headers
    end

    def self.post(route, params, headers)
      RestClient.post("#{BASE_URL}#{route}",
        params.to_json,
        headers.merge('Content-Type' => 'application/json')) { |response| response }
    end

    def self.get(route, headers)
      RestClient.get("#{BASE_URL}#{route}",
        headers
      )
    end

    def self.put(route, body, headers)
      RestClient.put("#{BASE_URL}#{route}",
        body,
        headers) { |response| response }
    end
  end
end
