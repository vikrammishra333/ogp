=begin

  @File Name                 : photo.rb
  @Company Name              : Mindfire Solutions Private Limited
  @Creator Name              : Vikram Kumar Mishra
  @Date Created              : 2013-03-03
  @Date Modified             :
  @Last Modification Details :
  @Purpose                   : To manage photos

=end

class Photo < ActiveRecord::Base

  #defining variables accessible throughout the class
  attr_accessible :gallery_id, :image, :name, :remote_image_url

  #defining relationships
  belongs_to :gallery

  #carrierwave gem's necessary step to attach uploader with a model
  mount_uploader :image, ImageUploader

  #using callbacks
  after_destroy :remove_photo_directory



  
  protected

  #remove empty directory upon image deletion
  def remove_photo_directory

    #using library class FIleUtils method remove_dir to remove the directory
    FileUtils.remove_dir("#{Rails.root}/public/uploads/#{self.class.to_s.underscore}/image/#{id}", :force => true)

  end # end method
  
end # end class
