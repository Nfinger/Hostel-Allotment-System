class BordersController < ApplicationController
  before_action :logged_in_user, only:  [:index,:edit, :update,:show]
  before_action :correct_user, only: [:edit,:update]
  before_action :is_active, only: [:show]
  #before_action :is_allocation_start, only: [:checklist]

  def hello
    @border=Border.all
  end
  def new
    @user=Border.new
  end
  
  def show
    @user=Border.find(params[:id])
    @hostel=session[:hostel]
    if !@hostel.nil?
      @active="a"
      #@active=is_active?(@user)
    end

  end

  def edit
    @border=Border.find(current_user.id)
  end
  def update
    @border=Border.find(params[:id])
    @border.update(active:true)
    if @border.update_attributes(user_params)
      # Handle a successful update.
      redirect_to profile_path(@border.id)
    else
      @border.update(active:true)
    render 'edit'
  end
  end
  
  def create
    @user=Border.new(user_params)
    if @user.save
      log_in @user
      flash[:success]="Welcome to the NITH Hostel Room Alotments"
      redirect_to @user
      #jk
    else
      render 'new'
    end
  end

  def checklist1
    preferences=["Preference1","Preference2","Preference3"]
    roll_no=Border.find_by(id:session[:user_id]).roll_no
    preferences.each do |preference|
      preference_model=preference.constantize
      if !preference_model.find_by(roll_no:roll_no).nil?
        @borders=preference_model.all.order('cgpi DESC')
      end
    end
  end

  def checklist
    preferences={"1"=>"Preference1","2"=>"Preference2","3"=>"Preference3","4"=>"Preference4"}
    year=params[:year]
    preference=preferences[year]
    preference_model=preference.constantize
    @rank=0
    @borders=preference_model.all.order('cgpi DESC')
  end
  def ungroup
    current_user.grouped=false
    current_user.save
    a=Roommate.find_by(roommate:current_user.roll_no)
    if !a.nil?
      a.destroy
    end
    redirect_to current_user
  end
  
  private

    def user_params
      params.require(:border).permit(:roll_no,:name,:email,:phone_no,:parent_phone_no,:address)
    end

    def logged_in_user
      unless logged_in?
        store_location
        log_out
        flash[:danger] = "Please log in."
        redirect_to root_url
      end
    end
    # Confirms the correct user.
    def correct_user
      @user = Border.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    def is_allocation_start
      redirect_to(root_url) unless !session[:hostel].nil?
    end

    def is_active
      redirect_to(edit_path(current_user.id)) unless current_user.active
    end

    def is_grouped
      redirect_to(current_user) unless current_user.grouped
    end

end
