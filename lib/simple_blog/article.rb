module Simple_Blog
  class Article

    def initialize ( title, body )
      
      # TODO Scrub the suffix txt from the title, done here or when passed
      # into this class.
      
      @title = title
      @body  = body
    end
  
    attr_reader :title, :body
  
  end
end