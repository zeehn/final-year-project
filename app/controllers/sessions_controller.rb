class SessionsController < ApplicationController
  def new
  end

  def create
    user = find_user(params[:email])
    respond_to do |format|
      if user && user.authenticate(params[:password])
        session[:user_id] = user.email
        format.html { redirect_to user, notice: "Welcome!" }
      else
        flash.now[:alert] = "Invalid email/password combination" 
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
      flash.now[:notice] = "Signed Out!"
      format.html { redirect_to root_path }
    end
  end

private 
  def find_user(email)
    Maid.find_by(email: email) or Client.find_by(email: email) or Admin.find_by(email: email)
  end
end
