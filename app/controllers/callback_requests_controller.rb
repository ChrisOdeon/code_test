class CallbackRequestsController < ApplicationController
  
  def new
    @callback_request = CallbackRequest.new
  end

  def create
    @callback_request = CallbackRequest.new(callback_request_params)

    if @callback_request.valid?
      if request_callback
        flash[:success] = 'Request successful! We will call you back as soon as possible.'
        redirect_to root_url
      else
        @callback_request.errors.add(:base, 'Something went wrong with your request')
        render :new
      end

    else
      render :new
    end

  end

  private

  def request_callback
    Mic::Api.request_callback(
      name: @callback_request.name,
      business_name: @callback_request.business_name,
      tel_number: @callback_request.tel_number,
      email: @callback_request.email
    )
  end

  def callback_request_params
    params.require(:callback_request).permit(:name, :business_name, :email, :tel_number)
  end
end