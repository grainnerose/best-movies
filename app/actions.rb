helpers do
  def logged_in?
    session[:user_id]
  end

  def current_user
    if logged_in?
      return User.find(session[:user_id])
    end
  end
end

# Homepage (Root path)
get '/' do
  erb :index
end

get '/movies' do
  @movies = Movie.all
  erb :movies
end

get '/movies/:id' do
  @movie = Movie.find(params[:id])
  erb :movie
end

# Login Page
get '/login' do
  erb :login
end

# Do Login
post '/login' do
  # Try to find user using the email
  user = User.find_by(email: params[:email])

  # Did we find a user?
  # If found user... do the passwords match?
  if user && user.password == params[:password]
    # If a user was found and passwords match...
    # Log user in
    session[:user_id] = user.id

    # send them to /movies page
    redirect "/movies"
  else
    @error = "Email or password incorrect"
    erb :login
  end
end

# Signup Page
get '/signup' do
  erb :signup
end

# Do Signup
post '/signup' do
  # Grab information from user (params)
  # Create new user in database
  new_user = User.create({
    email: params[:email],
    password: params[:password],
    username: params[:username]
  })

  # Log new user in
  session[:user_id] = new_user.id

  # Send user to /movies
  redirect "/movies"
end

get '/logout' do
  session.clear
  redirect "/"
end