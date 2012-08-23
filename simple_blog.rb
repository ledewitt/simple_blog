require "sinatra"
require "sinatra/reloader" if development?

get('/') {
  erb :home
}