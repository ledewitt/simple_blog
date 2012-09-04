module Simple_Blog
  class ArticleList

    def initialize
      @article_list = Array.new

      Dir.foreach ("./articles/") do |file|
        if file.include?(".txt")
          article = Simple_Blog::Article.new(
                        "#{File.basename(file, ".txt")}")
          @article_list << article
        end

      end      
    end

    def each(&block)
      @article_list.each(&block)
    end

  end
end