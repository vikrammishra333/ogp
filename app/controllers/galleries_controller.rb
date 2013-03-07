=begin

  @File Name                 : galleries_controller.rb
  @Company Name              : Mindfire Solutions Private Limited
  @Creator Name              : Vikram Kumar Mishra
  @Date Created              : 2013-03-03
  @Date Modified             :
  @Last Modification Details :
  @Purpose                   : To handle communication between gallery's data layer and presentation layer

=end

class GalleriesController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :fetch_user, :load_assets
  
  # GET /galleries
  # GET /galleries.json
  def index
    
    @galleries = @user.galleries

    respond_to do |format|
      
      format.html # index.html.erb
      format.json { render json: @galleries }
      
    end
    
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    
    @gallery = @user.galleries.find(params[:id])

    respond_to do |format|
      
      format.html # show.html.erb
      format.json { render json: @gallery }
      
    end
    
  end

  # GET /galleries/new
  # GET /galleries/new.json
  def new
    
    @gallery = @user.galleries.build

    respond_to do |format|
      
      format.html # new.html.erb
      format.json { render json: @gallery }
      
    end
    
  end

  # GET /galleries/1/edit
  def edit
    
    @gallery = @user.galleries.find(params[:id])
    
  end

  # POST /galleries
  # POST /galleries.json
  def create
    
    @gallery = @user.galleries.build(params[:gallery])

    respond_to do |format|
      
      if @gallery.save
        
        format.html { redirect_to user_galleries_path(current_user), notice: 'Gallery was successfully created.' }
        format.json { render json: @gallery, status: :created, location: @user.galleries }
        
      else
        
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
        
      end
      
    end
    
  end

  # PUT /galleries/1
  # PUT /galleries/1.json
  def update
    
    @gallery = @user.galleries.find(params[:id])

    respond_to do |format|
      
      if @gallery.update_attributes(params[:gallery])
        
        format.html { redirect_to user_galleries_path(current_user), notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
        
      else
        
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
        
      end
      
    end
    
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    
    @gallery = @user.galleries.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      
      format.html { redirect_to user_galleries_path(current_user) }
      format.json { head :no_content }
      
    end
    
  end
  
  private
  
  def fetch_user
  
    @user = User.find(params[:user_id])
    
  end

  def load_assets

    #AssetManager.include_local_library [:application]
    AssetManager.include_css [:galleries]

  end
  
end
