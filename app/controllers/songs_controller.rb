require 'rack-flash'

class SongsController < ApplicationController
   # set :views, Proc.new { File.join(root, "../views/songs") }
   use Rack::Flash

  get '/songs' do
    @all_songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @all_genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.find_or_create_by(name: params[:name])
    @artist = Artist.find_or_create_by(name: params[:artist_name])
    #@genre = Genre.find_or_create_by(name: params[:genre_name])
    @song.genre_ids = params[:genres]
    @song.artist = @artist
    @song.save
  flash[:message] = "Successfully created song."
  redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end


end
