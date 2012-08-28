require "sinatra"
require "sinatra/reloader" if development?
require_relative "lib/simple_blog/article_list"

# TODO: Should change the following variables into a hash reading it out of
# a single file of environment variables rather then a folder.

TITLE     = File.read("./env_vars/blog_title.txt")
SUBTITLE  = File.read("./env_vars/blog_subtitle.txt")
COPYRIGHT = File.read("./env_vars/copyright.txt")

ARTICLES  = Simple_Blog::ArticleList.new

get('/') {
  # Get each of the articles as in the snippet of code in reading_article.rb
  # Can you figure out how to link that code?  Would be cool to just call it
  # form the lib folder and have it fill some kind of container.
  erb :home, locals: { title:     TITLE,
                       subtitle:  SUBTITLE,
                       copyright: COPYRIGHT,
                       articles:  ARTICLES }
}

get('/add_article') {
  erb :add_article
}

post('/add_article') {
  erb :article
}

get('/admin') {
  erb :admin
}

post('/admin') {
  erb :admin # if password wrong
  erb :add_article # if password correct
}

get('/article') {
  erb :article
}