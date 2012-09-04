module Simple_Blog
  class Article

    def initialize(title)
      @title = title
    end
  
    attr_reader :title
    
    def body
      File.read("articles/#{@title}.txt")
    end
  
  end
end