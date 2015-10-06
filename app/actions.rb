# Homepage (Root path)
get '/' do
  erb :index
end

get '/movies' do
  @movies = Movie.all
  erb :movies
end