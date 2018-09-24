require 'rails_helper'

describe Mic::Api do
   context 'I make an API callback request' do
    let(:result) do
      VCR.use_cassette 'mic_api/api_successful_response' do
        Mic::Api.request_callback(
          name: 'Test Name',
          business_name: 'Test Business Name',
          tel_number: '01234567890',
          email: 'testname@example.com'
        )
      end
    end

    it 'should work' do
      expect(result).to eq true
    end
  end
end