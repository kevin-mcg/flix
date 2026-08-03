module ApplicationHelper

  def current_user
    # memoization - to avoid additional cache calls to fid the user...
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
