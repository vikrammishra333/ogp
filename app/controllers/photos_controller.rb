=begin

  @File Name                 : photos_controller.rb
  @Company Name              : Mindfire Solutions Private Limited
  @Creator Name              : Vikram Kumar Mishra
  @Date Created              : 2013-03-03
  @Date Modified             :
  @Last Modification Details :
  @Purpose                   : To handle communication between photo's data layer and presentation layer

=end

class PhotosController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :get_gallery
  
  # GET /photos
  # GET /photos.json
  def index
    
    @photos = @gallery.photos

    respond_to do |format|

      format.html # index.html.erb
      format.json { render json: @photos }
      
    end
    
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    
    @photo = @gallery.photos.find(params[:id])

    respond_to do |format|

      format.html # show.html.erb
      format.json { render json: @photo }
      
    end
    
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    
    #@photo = Photo.new(:gallery_id => params[:gallery_id])
    @photo = @gallery.photos.build

    respond_to do |format|
      
      format.html # new.html.erb
      format.json { render json: @photo }
      
    end
    
  end

  # GET /photos/1/edit
  def edit
    
    @photo = @gallery.photos.find(params[:id])
    
  end # end action edit

  # POST /photos
  # POST /photos.json
  def create
    
    @photo = @gallery.photos.build(params[:photo])

    respond_to do |format|
      
      if @photo.save
        
        format.html { redirect_to user_gallery_path(current_user,@gallery), notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
        
      else
        
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
        
      end
      
    end
    
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    
    @photo = Photo.find(params[:id])

    respond_to do |format|
      
      if @photo.update_attributes(params[:photo])
        
        format.html { redirect_to user_gallery_path(current_user,@gallery), notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
        
      else
        
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
        
      end
      
    end
    
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      
      format.html { redirect_to user_gallery_path(current_user,@gallery), notice: 'Photo was successfully deleted.' }
      format.json { head :no_content }
      
    end
    
  end
  
  private
  
  def get_gallery
    
    @gallery = current_user.galleries.find(params[:gallery_id].to_i)
    
  end
  
end # end class
