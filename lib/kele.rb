require 'httparty'

class Kele

    include HTTParty
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
      #puts @user_data
      #puts "User id: #{@user_data["id"]}"
      @user_data["id"]
    end

end
