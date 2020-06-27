class UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @tweets = @user.tweets
  end

  def search_user
  end

  def search
    if params[:username].present?
      @users = User.search(params[:username])
      @users = current_user.except_current_user(@users)
      if @users
        respond_to do |format|
          format.js { render partial: 'users/user_result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = 'Could not find a user'
          format.js { render partial: 'users/user_result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Please enter a username'
        format.js { render partial: 'users/user_result' }
      end
    end
    
  end
end
