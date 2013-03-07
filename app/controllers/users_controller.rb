=begin

  @File Name                 : users_controller.rb
  @Company Name              : Mindfire Solutions Private Limited
  @Creator Name              : Vikram Kumar Mishra
  @Date Created              : 2013-02-26
  @Date Modified             :
  @Last Modification Details :
  @Purpose                   : To handle communication between user's data layer and presentation layer

=end

class UsersController < ApplicationController
  
  #calling devise's helper method to ensure user login
  before_filter :authenticate_user!

  #calling a private methid to include necessary CSS and JS
  before_filter :load_assets
  
  # GET /users
  # GET /
  def index
    
    #retrieve all users info from database
    @users = User.all
    
  end # end action index

  def show

    @user = User.find(params[:id])

  end

  def destroy

    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html {redirect_to users_path, notice: "User is successfully deleted."}
    end

  end
  
  def edit_password
    
    @user = current_user
    
  end # end method edit_password
  
  def update_password
    
    # retrieve current logged in user's info from DB
    @user = User.find(current_user.id)
    
    #calling devise method to update password on user object
    if @user.update_with_password(params[:user])
      
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to root_path
      
    else
      
      render "edit_password"
      
    end # end if
    
  end # end method update_password

  private

  def load_assets

    #AssetManager.include_local_library [:application]
    AssetManager.include_css [:users]
    
  end
  
end # end controller class