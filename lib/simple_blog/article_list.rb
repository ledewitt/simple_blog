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
    
    def number_of_pages(articles_per_page)
      (@article_list.count.to_f/articles_per_page).ceil
    end
    
    def pagination(page, numb_articles)
      @article_list[(page-1)*numb_articles..(page*numb_articles)-1]
    end

  end
end