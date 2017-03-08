require 'httparty'
require 'json'

class Kele
  include HTTParty
  include JSON
  def initialize(email, password)
    response = self.class.post(bloc_api("sessions"), body: { "email": email, "password": password })

    raise Error.new("Incorrect email or password") if response["auth_token"] == nil
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get(bloc_api("users/me"), headers: {"authorization" => @auth_token })

    JSON.parse(response.body)
  end

  def bloc_api(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end
end
