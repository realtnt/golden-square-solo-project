require 'text_service'

RSpec.describe TextService do
  context 'When calling send_text' do
    it 'it should fail: Method not implemented' do
      service = TextService.new
      expect{service.send_text}.to raise_error('Method not implemented')
    end
  end
end