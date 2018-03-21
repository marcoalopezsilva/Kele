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
    def create_example_message
        response = self.class.post('/messages', headers: {"authorization" => "eyJ0eXAiOiJKV1QiLCJhhGciOiJIUzI1NiJ9.eyJhcGlfa2V5IjoiYTc2MDZkNTBhYjA3NDE4ZWE4ZmU5NzliY2YxNTM1ZjAiLCJ1c2VyX2lkIjoyMzAzMTExLCJuYW1lIjoiQmVuIE5lZWx5In0.3VXD-FxOoxaGXHu6vmL8g191bl5F_oKe9qj8Khmp9F0" }, body:
            {   "sender":"strong.bad@strongbadia.gov",
                "recipient_id":2,
                "token": "abcd",
                "subject":"Royale with cheese",
                "stripped-text":"That's what they call a quarter pounder in France."
            } )
    end
=end

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

end
