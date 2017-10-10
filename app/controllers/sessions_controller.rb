class SessionsController < ApplicationController
  def new
  end

  def create
  	user=Border.find_by(roll_no: params[:session]["roll_no"])
  	if user && user.authenticate(params[:session]["password"])
  		log_in user
      assign_hostel
  		redirect_back_or user  #this will redirect user to desired page
  	else
  		flash[:danger]="Invalid email or password"
  		redirect_to '/'
  	end
  end
  def destroy
  	log_out
    redirect_to root_url

  end
end
