module Simple_Blog
  class ArticleList

    def initialize
      @article_list = Array.new

      Dir.glob("articles/*.txt") do |file|
        article = Simple_Blog::Article.new(
                        "#{File.basename(file, ".txt")}")
        @article_list << article
      end
    end

    def each(&block)
      @article_list.each(&block)
    end

  end
end