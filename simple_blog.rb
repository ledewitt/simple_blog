require "yaml"
require "sinatra"
require "sinatra/reloader" if development?
require_relative "lib/simple_blog/article_list"
require_relative "lib/simple_blog/article"
require_relative "lib/simple_blog/links"

# TODO: Should change the following variables into a hash reading it out of
# a single file of environment variables rather then a folder.

LINKS     = Simple_Blog::Links.new

CONFIG = YAML.load(File.read("blog_config.yml"))

get('/') {
  # Get each of the articles as in the snippet of code in reading_article.rb
  # Can you figure out how to link that code?  Would be cool to just call it
  # form the lib folder and have it fill some kind of container.
  
  articles = Simple_Blog::ArticleList.new
  
  erb :home, locals: { links:    LINKS,
                       articles: articles }
}

get('/add_article') {
  erb :add_article, locals: { links: LINKS }
}

post('/add_article') {
  # With the params coming from the form write that data to the article folder
  
  File.open("articles/#{params[:title]}.txt", 'w') {|f|
                                  f.write(params[:body])}
                                  
  article = Simple_Blog::Article.new(params[:title])
  
  erb :article, locals: { links:     LINKS,
                          article:   article }
}

get('/admin') {
  erb :admin
}

post('/admin') {
  erb :admin # if password wrong
  erb :add_article # if password correct
}

get('/article/:article_title') {
  
  # Create the article object using title and pass it down
  
  article = Simple_Blog::Article.new(params[:article_title])
  
  erb :article, locals: { links:     LINKS,
                          article:   article }
}