require "sinatra"
require "sinatra/reloader" if development?

get('/') {
  erb :home
}

get('/compose') {
  erb :compose
}