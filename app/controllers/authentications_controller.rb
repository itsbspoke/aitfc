class AuthenticationsController < ApplicationController

  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    oauth_hash = env["omniauth.auth"]
    existing_auth = Authentication.find_by_oauth_hash(oauth_hash)
    if existing_auth.nil?
      auth = Authentication.from_omniauth(current_user, oauth_hash)
      flash[:notice] = "Authentication successful."
      redirect_to authentications_url
    else
      sign_in(:user, existing_auth.user)
      flash[:notice] = "Social Sign-in successful."
      redirect_to(root_path)
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end

end
