# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController

  def new
  end

  def create
    # let's login the user
    # TODO: we will improve this in future
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_url
    else
      render 'new'
    end
  end

  def destroy
  end

end
