=begin

  @File Name                 : gallery.rb
  @Company Name              : Mindfire Solutions Private Limited
  @Creator Name              : Vikram Kumar Mishra
  @Date Created              : 2013-03-03
  @Date Modified             :
  @Last Modification Details :
  @Purpose                   : To manage galleries

=end

class Gallery < ActiveRecord::Base
  
  attr_accessible :description, :title, :user_id 
  belongs_to :user
  has_many :photos, :dependent => :delete_all
  
end # end class
