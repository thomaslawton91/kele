require 'kele/roadmap.rb'
require 'httparty'
require 'json'

class Kele
  include Roadmap
  include HTTParty
  include JSON
  def initialize(email, password)
    response = self.class.post(bloc_api("sessions"), body: { "email": email, "password": password })

    raise Error.new("Incorrect email or password") if response["auth_token"] == nil
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get(bloc_api("users/me"), headers: {"authorization" => @auth_token })

    @user_data = JSON.parse(response.body)
    @user_data
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get(bloc_api("#{mentor_id}/student_availability"), headers: {"authorization" => @auth_token })

    @mentor_availability = JSON.parse(response.body)
    @mentor_availability
  end

  def bloc_api(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end
end
