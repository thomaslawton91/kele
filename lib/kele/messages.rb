module Messages
  def get_messages(page=1)
    result = self.class.get(bloc_api("message_threads?page=#{page}"), headers: {"authorization" => @auth_token})

    @messages = JSON.parse(result.body)
    @messages
  end
  def create_message(recipient_id, token=nil, subject, message)
    response = self.class.post(bloc_api("messages"), body: { "sender": @email, "recipient_id": recipient_id, "token": token, "subject": subject, "stripped-text": message }, headers: { "authorization" => @auth_token })
    puts response
  end
end
