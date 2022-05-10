require 'text_service'

class Twilio < TextService
  def initialize(api_key, text, mobile)
    @api_key = api_key
    @text = text
    @mobile = mobile
  end

  def send_text
    # sends the text using Twilio
    # returns nothing ???? or true/false for success/failure??
  end
end