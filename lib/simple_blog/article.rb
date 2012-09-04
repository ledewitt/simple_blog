module Simple_Blog
  class Article

    def initialize ( title )
      @title = title
      @body  = File.read("./articles/#{title}.txt")
    end
  
    attr_reader :title, :body
  
  end
end