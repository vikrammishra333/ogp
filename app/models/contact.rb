=begin

  @File Name                 : contact.rb
  @Company Name              : Mindfire Solutions Private Limited
  @Creator Name              : Vikram Kumar Mishra
  @Date Created              : 2013-03-03
  @Date Modified             :
  @Last Modification Details :
  @Purpose                   : To manage user contacts

=end

class Contact < ActiveRecord::Base
  
  attr_accessible :address, :alternative_email, :city, :country, :mobile_number, :postal_code, :state
  
  belongs_to :user
  
end # end class
