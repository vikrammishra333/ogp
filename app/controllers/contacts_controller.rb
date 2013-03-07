class ContactsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :fetch_user
  
  # GET /contacts
  # GET /contacts.json
  def index
    
    @contacts = @user.contact

    respond_to do |format|
      
      format.html # index.html.erb
      format.json { render json: @contacts }
      
    end
    
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    
    @contact = @user.contact

    respond_to do |format|
      
      format.html # show.html.erb
      format.json { render json: @contact }
      
    end
    
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    
    #@contact = Contact.new(:user_id => params[:user_id])
    @contact = @user.build_contact
    
    respond_to do |format|
      
      format.html # new.html.erb
      format.json { render json: @contact }
      
    end
    
  end

  # GET /contacts/1/edit
  def edit
    
    @contact = @user.contact
    
  end

  # POST /contacts
  # POST /contacts.json
  def create
    
    #@contact = Contact.new(params[:contact])
    @contact = @user.build_contact(params[:contact])
    
    respond_to do |format|
      
      if @contact.save
        
        format.html { redirect_to @user, notice: 'Contact was successfully created.' }
        format.json { render json: @contact, status: :created, location: @user }
        
      else
        
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
        
      end
      
    end
    
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    
    #@contact = Contact.find(params[:id])
    @contact = @user.contact

    respond_to do |format|
      
      if @contact.update_attributes(params[:contact])
        
        format.html { redirect_to @user, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
        
      else
        
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
        
      end
      
    end
    
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    
    @contact = @user.contact
    @contact.destroy

    respond_to do |format|
      
      format.html { redirect_to users_url }
      format.json { head :no_content }
      
    end
    
  end
  
  private
  
  def fetch_user
    
    @user = current_user
    
  end
  
end
