=begin

  @File Name                 : user.rb
  @Company Name              : Mindfire Solutions Private Limited
  @Creator Name              : Vikram Kumar Mishra
  @Date Created              : 2013-02-26
  @Date Modified             :
  @Last Modification Details :
  @Purpose                   : To manage users, user profiles and its associated table

=end

class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :login, :first_name, :middle_name, :last_name,
                  :joining_date, :emp_id, :avatar, :avatar_cache, :remove_avatar
  
  # Setup accessor attributes for your model
  attr_accessor :login
  
  
  #calling carrierwave method to handle file uploads
  mount_uploader :avatar, AvatarUploader

  #defining relationships
  has_many :galleries, :dependent => :delete_all
  has_one :contact, :dependent => :destroy
  
  #################### Validate required fields ###########################################
  
  validates :avatar, :presence => true
  validates_integrity_of  :avatar
  validates_processing_of :avatar
  validates_email_realness_of :email
  
  #################### End validation #####################################################
  
  # override devise function to handle user's login via email or username
  def self.find_first_by_auth_conditions(warden_conditions)
    
    conditions = warden_conditions.dup
    
    if login = conditions.delete(:login)
      
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      
    else
      
      where(conditions).first
      
    end # end if
    
  end # end method

  def name

    name = first_name|| ""

    if not middle_name.nil?
      
      name = name+" "+middle_name

    elsif not last_name.nil?

      name = name+" "+last_name
      
    end
    

  end
  
end # end class