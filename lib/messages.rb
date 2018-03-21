require 'httparty'
require 'json'

module Messages

    include HTTParty

    def get_messages(page = nil)
        if page
            response = self.class.get('/message_threads',  headers: {"authorization" => @auth_token, "page" => page.to_s } )
        else
            response = self.class.get('/message_threads',  headers: {"authorization" => @auth_token } )
        end
        @messages = JSON.parse(response.body)
    end

end
