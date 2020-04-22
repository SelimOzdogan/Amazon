class ContactusController < ApplicationController
  def root
  end

  def post_contact
    #byebug
    @full_name = params[:full_name]
    @email = params[:email]
    @message = params[:message]
   #  render :thank_you
   render(plain: "Thank you  for contacting us!")
  end
end
