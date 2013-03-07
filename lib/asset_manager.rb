class AssetManager

  #Class methods
  #including css file. Checking for file is array type or normal string.
  def self.include_css file

    tmp_arr = []

    if file.class == Array

      file.each do |f|

        include_css_file_individual f, tmp_arr

      end

    else

      include_css_file_individual file, tmp_arr
      
    end
    
  end # end method

  #Include javascript files in contrib directory
  def self.include_contrib_library library
    
    include_js_library library, :contrib
    
  end # end method

  #Including local javascript files
  def self.include_local_library library
    
    include_js_library library, :local
    
  end # end method

  #Including all javscript library  whether from local or contrib folder
  def self.include_js_library library, type = :local
    
    tmp_arr = []
    
    if library.class == Array

      library.each do |l|

        include_js_library_individual l, type, tmp_arr

      end

    else

      include_js_library_individual library, type, tmp_arr
      
    end
    
  end # end method

  #Get libraries
  def self.get_libraries
    
    return @@js_includes
  
  end # end method

  #get css
  def self.get_css

    return @@css_includes
  
  end # end method

  #private methods start here
  private

  #Declaring class variables
  @@js_includes = []
  @@css_includes = []

  # including local javscript files
  def self.include_js_library_individual library, type, tmp_arr

    file = ""
    
    case type
      
      when :local

        if library.class == Symbol

          file = library.to_s + ".js"

        else

          file = library

        end

      when :contrib
        
        file = "contrib/" + @@libraries[library]
        
    end  # end case

    tmp_arr << file
    @@js_includes << tmp_arr

  end # end method

  #Including css files individually
  def self.include_css_file_individual file, tmp_arr

    if file.class == Symbol

      file = file.to_s + '.css'
      
    end

    tmp_arr << file
    @@css_includes = tmp_arr
    
  end # end method

end # end class
