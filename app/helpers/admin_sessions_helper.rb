module AdminSessionsHelper
	def admin_log_in(user)
		session[:admin_id]=user.id
	end
	def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
    end
  	def admin_logged_in?
    !current_admin.nil?
  	end

  	def admin_log_out
    session.delete(:admin_id)
    @current_admin = nil
  end

  # Redirects to stored location (or to the default).
  def redirect_back_to_admin_or(default)
    redirect_to(session[:admin_forwarding_url] || default)
    session.delete(:admin_forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_admin_location
    session[:admin_forwarding_url] = request.original_url if request.get?
  end
end
