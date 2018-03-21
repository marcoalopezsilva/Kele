require 'httparty'
require 'json'
# Next line: we have to require the Roadmap module
require 'roadmap'
require 'messages'

class Kele

    include HTTParty
    # Next line: we have to include the Roadmap module so we can use it from the Kele class
    include Roadmap
    include Messages

    base_uri 'https://www.bloc.io/api/v1'

    def initialize(username, password)
        response = self.class.post("/sessions", body: {email: username, password: password})
        if response && response["auth_token"]
            @auth_token = response["auth_token"]
            puts "User #{username} has successfully logged in"
            puts "Authentication token: #{@auth_token}"
        else
            puts "Invalid login!"
        end
    end

    def get_me
      response = self.class.get("/users/me", headers: {"authorization" => @auth_token })
      @user_data = JSON.parse(response.body)
      # Next line if we want the method to return id only
      #@user_data["id"]
    end

    def get_mentor_availability(mentor_id)
      #First I need to construct a path I can pass to the get method
      mentor_path = "/mentors/" + mentor_id.to_s + "/student_availability"
      #Next line gets the information, by passing the mentor_path and authentication token
      response = self.class.get(mentor_path,  headers: {"authorization" => @auth_token })
      #Then I need to parse the response
      @mentor_schedule = JSON.parse(response.body)
      #Next line if we want to , and select only "available" slots (i.e. those with "booked" == nil)
      #@mentor_availability = mentor_schedule.select{ |item| item["booked"] == nil }
    end

end
