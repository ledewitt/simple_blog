module Simple_Blog
  class ArticleList

    def initialize
      @article_list = Array.new

      Dir.glob("articles/*.txt") do |file|
        article = Simple_Blog::Article.new(
                        "#{File.basename(file, ".txt")}")
        @article_list << article
      end
      
      @article_list.sort_by! { |a| -a.time_created.to_i }
    end

    def each(&block)
      @article_list.each(&block)
    end

  end
end