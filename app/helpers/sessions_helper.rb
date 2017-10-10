module SessionsHelper

	def log_in(user)
		session[:user_id]=user.id 
	end

	def current_user
    @current_user ||= Border.find_by(id: session[:user_id])
    end
  	def logged_in?
    !current_user.nil?
  	end

  	def log_out
    session.delete(:user_id)
    session.delete(:hostel)
    session.delete(:floor)
    session.delete(:year)
    @current_user = nil
  end

  def assign_hostel
    user=current_user
    floor_dic={}
    preferences=["Preference1","Preference2","Preference3","Preference4"]
    years={"Preference1"=>"1","Preference2"=>"2","Preference3"=>"3","Preference4"=>"4"}
    preferences.each do |preference|
      preference_model=preference.constantize   #.constantize will convert class name to actual class
      if !preference_model.find_by(roll_no:user.roll_no).nil?
        hostels=AlloteHostel.where(preference:preference).map(&:hostel).uniq  #this will return list with only unique hostels
        hostels.each do |hostel|
          floors=AlloteHostel.where(preference:preference,hostel:hostel).map(&:floor).uniq
          floor_dic[hostel]=floors
        end
      
        session[:hostel]=hostels
        session[:floor]=floor_dic
        session[:year]=years[preference]
      end

    end
  end

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
  

end
