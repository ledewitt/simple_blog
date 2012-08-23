require "sinatra"
require "sinatra/reloader" if development?

get('/') {
  erb :home
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