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
=begin
    def create_message(recipient_id, subject, text)
        if @user_data
            sender = @user_data["email"]
        else
            get_data = self.get_me
            sender = get_data["email"]
        end
        response = self.class.post('/messages', headers: {"authorization" => @auth_token }, body: {"sender" => sender, "recipient_id" => recipient_id, "subject" => subject, "stripped_text" => text.strip })
        puts "Email sent!" if response.success?
    end
=end
    def create_message(recipient_id, subject, token = nil, text)
        if @user_data
            sender = @user_data["email"]
        else
            get_data = self.get_me
            sender = get_data["email"]
        end
        response = self.class.post('/messages', headers: {"authorization" => @auth_token }, body: {"sender" => sender, "recipient_id" => recipient_id, "subject" => subject, "stripped_text" => text.strip, "token" => token})
        puts response if !response.success?
        puts "Email sent!" if response.success?
    end

end
