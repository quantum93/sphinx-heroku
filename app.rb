require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/albums.rb')

get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums') do
  @albums = Album.all
  erb(:albums)
end

get ('/albums/new') do
  erb(:new_album)
end

get ('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

# get ('/albums/:name') do
#   @album = Album.search(params[:name])
#   erb(:album)
# end

post ('/albums') do
  name = params[:album_name]
  year = params[:album_year]
  genre = params[:album_genre]
  artist = params[:album_artist]
  album = Album.new(name, year, artist, genre, nil)
  album.save()
  @albums = Album.all()
  erb(:albums)
end

get ('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

patch ('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update(params[:name])
  @albums = Album.all
  erb(:albums)
end

delete ('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:albums)
end

get ('/custom_route') do
  erb(:custom_route)
end

get ('/search_album') do
  @albums = Album.all
  erb(:albums)
end

post ('/query_album') do
  # "Hello world"
  @albums = Album.search(params[:name])
  # binding.pry
  erb(:search_album)
end
