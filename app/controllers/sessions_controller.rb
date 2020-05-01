class SessionsController < ApplicationController
  protect_from_forgery  with: :exception
  # skip_before_filter :verify_authenticity_token, if: -> { controller_name == 'sessions' && action_name == 'create' }

  def new
  
  end

  def create
    user = User.find_by_email params[:email]
    if user&.authenticate params[:password]
      session[:user_id] = user.id 
        flash[:success] = "User Logged In"
        redirect_to products_path
    else
      flash[:warning] = "Couldn't Log In"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_path
  end

end
