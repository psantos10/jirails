module SessionsHelper

  def current_user
    # TODO: we will improve this one later
    user = User.find(session[:user_id])
  end

  def logged_in?
    # TODO: We will change this too..
    current_user
  end

end
