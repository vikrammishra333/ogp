module GalleriesHelper
  
  def get_random_photo_from_gallery gallery
    
    gallery.photos.order("RAND()").limit(1).first
    
  end # end method
  
end
