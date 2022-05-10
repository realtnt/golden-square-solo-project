class TextSender
  def initialize(text, service) # text to send, 
                                # service is an instance of TextService
    @text = text
    @service = service
  end

  def send
    # calls the TextService's send_text method to send the text
  end
end