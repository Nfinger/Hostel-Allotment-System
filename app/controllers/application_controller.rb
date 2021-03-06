class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception 
  include SessionsHelper
  include RoomAllotementsHelper
  include AdminSessionsHelper
  include BordersHelper
  before_filter :set_cache_headers

  private

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
end
