require "sinatra"
require "sinatra/reloader" if development?

TITLE    = File.read("./window_dressing/blog_title.txt")
SUBTITLE = File.read("./window_dressing/blog_subtitle.txt")

get('/') {
  # Get each of the articles as in the snippet of code in reading_article.rb
  # Can you figure out how to link that code?  Would be cool to just call it
  # form the lib folder and have it fill some kind of container.
  erb :home, locals: { title:    TITLE,
                       subtitle: SUBTITLE }
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