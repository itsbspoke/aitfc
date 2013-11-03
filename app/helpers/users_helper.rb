module UsersHelper

  def this_user_is_logged_in?
    current_user == @user
  end
end
