require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'

get '/' do
  erb :home #file in views folder
end

get '/movielist' do
  @id = params['id']
  url = "http://omdbapi.com/?s=#{@id}"
  movie_list = HTTParty.get url;

end

get '/movies' do
  @title = params['title']
  url = "http://omdbapi.com/?t=#{@title}"
  movie_info = HTTParty.get url;
  @plot = movie_info["Plot"]
  @poster = movie_info["Poster"]

  erb :movies #file in views folder
end
