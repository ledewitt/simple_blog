module Simple_Blog
  class Article

    def initialize(title)
      @title = title
    end
  
    attr_reader :title
    
    def body
      File.read("articles/#{@title}.txt")
    end
    
    def time_created
      File.stat("articles/#{title}.txt").mtime
    end
  
  end
end