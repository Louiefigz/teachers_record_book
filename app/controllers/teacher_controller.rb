class TeacherController < ApplicationController

  get '/login' do
    erb :'teacher/login'
  end

  post '/login' do
    @teacher = Teacher.find_by(username: params[:username])
    if @teacher && @teacher.authenticate(params[:password])
        session[:user_id] = @teacher.id
        redirect "/teacher/#{@teacher.slug}"
    else
      erb :"teacher/login", locals: {message: "Your username and/or password was not found in out database"}
    end
  end

  get '/signup' do
    erb :'teacher/signup'
  end

  post '/signup' do
    @teacher = Teacher.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/login'
  end

  get '/teacher/:slug' do
  @teacher = Teacher.find_by_slug(params[:slug])
    erb :'teacher/homepage'
  end

  get '/logout' do
    if is_logged_in?
      session.clear
      redirect '/'
    else
      redirect '/login'
    end
  end

end
