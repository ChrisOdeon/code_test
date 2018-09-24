require 'httparty'

class Mic::Api
  APIURL = ENV['LEAD_API_URI']
  TOKEN = ENV['LEAD_API_ACCESS_TOKEN']
  USERID = ENV['LEAD_API_PGUID']
  ACCNAME = ENV['LEAD_API_PACCNAME']
  PARTNERNAME = ENV['LEAD_API_PPARTNER']

  def self.request_callback(name:, business_name:, tel_number:, email:)
    callback_url = APIURL + '/api/v1/create'
    response = HTTParty.post(callback_url,
      body: request_body(name, business_name, tel_number, email),
      headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
    )

    response.parsed_response['message'] == 'Enqueue success'
  end

  private
  
  def self.request_body(name, business_name, tel_number, email)
    URI.encode_www_form(
      {
        access_token: TOKEN,
        pGUID: USERID,
        pAccName: ACCNAME,
        pPartner: PARTNERNAME,
        name: name,
        business_name: business_name,
        telephone_number: tel_number,
        email: email,
        contact_time: Time.now.utc.strftime("%Y-%m-%d %T"),
        notes: '',
        reference: ''
      }
    )
  end
end