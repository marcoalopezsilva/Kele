require 'httparty'

class Kele

    include HTTParty
    base_uri 'https://www.bloc.io/api/v1'

    def initialize(username, password)
        response = self.class.post("/sessions", body: {email: username, password: password})
        if response && response["auth_token"]
            puts "User #{username} has successfully logged in"
            puts "Authentication token: #{response["auth_token"]}"
        else
            puts "Invalid login!"
        end
    end


end
