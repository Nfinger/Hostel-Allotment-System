class AdminsController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :correct_user, only: [:show]
  def new
  end
  def show
  	@user=Admin.find(params[:id])
    @hostels=[]
    @floors={}
    @rooms={}
    Hostel.all.each do |hostel|
      @hostels.push(hostel.hostel_name)
      @floors[hostel.hostel_name]=hostel.hostel_name.constantize.all.map(&:floor).uniq
      @rooms[hostel.hostel_name]={}
      @floors[hostel.hostel_name].each do |floor|
          temp_room=hostel.hostel_name.constantize.where(floor:floor).map(&:room_no)
          @rooms[hostel.hostel_name][floor]=temp_room
      end
    end
  end

  def borderslist
    @hostel=params[:hostelname]
    @rooms=@hostel.constantize.all
    respond_to do |format|
        format.html
        format.xlsx
     end
  end
  def setdatetimepage
  end

  def checkpreference
    @students=Preftab1.all.order('cgpi DESC')
  end

  private
  def logged_in_user
      unless admin_logged_in?
        store_admin_location
        flash[:danger] = "Please log in."
        redirect_to adminlogin_url
      end
  end

    # Confirms the correct user.
  def correct_user
    @user = Admin.find(params[:id])
    redirect_to(root_url) unless @user == current_admin
  end
end
