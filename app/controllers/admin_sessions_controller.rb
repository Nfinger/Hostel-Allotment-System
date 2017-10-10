class AdminSessionsController < ApplicationController
  def new
  	if admin_logged_in?
      redirect_to current_admin
    end
  end
  def create
  	user=Admin.find_by(email:params[:admin][:email])
  	if user && user.authenticate(params[:admin][:password])
  		admin_log_in(user)
  		redirect_back_to_admin_or(user)
  	else
      flash[:danger]="enter a valid email/password"
  	render 'new'
  	end
  end

  def destroy
  	admin_log_out
  	redirect_to root_url
  end
end
