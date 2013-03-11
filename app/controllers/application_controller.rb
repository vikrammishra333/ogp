class ApplicationController < ActionController::Base
  
  protect_from_forgery
  before_filter :set_cache_buster
  
  # Method to prevent browser caching
  def set_cache_buster

    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"

  end # end method

  unless Rails.env == "test" or Rails.env == "development"

    begin

     # handle other ActiveRecord errors
     rescue_from ActiveRecord::ActiveRecordError, :with => :internal_error

     # handle not found error
     rescue_from ActiveRecord::RecordNotFound, :with => :page_404

    end # end block

    def internal_error

      # render data in different format
      respond_to do |format|

        format.html { render :file => "#{Rails.root}/public/500.html", :status => 500 }

      end # end respond_to block

    end # end mehtod

    def page_404

      # render data in different format
      respond_to do |format|

        format.html { render :file => "#{Rails.root}/public/404.html", :status => 404 }

      end # end respond_to block

    end # end mehtod

  end # end unless block
  
end


https://ap1.salesforce.com/02u90000000Vg6V

	00D90000000kTQ9