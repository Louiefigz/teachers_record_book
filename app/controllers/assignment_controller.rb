class AssignmentController < ApplicationController

  get '/assignment/new' do
    if is_logged_in?

      @teacher = Teacher.find(session[:user_id])
      binding.pry
      erb :'assignment/new'
    else
      redirect '/login'
    end
  end

  post '/assignment/new' do
    @assignment = Assignment.create(params)
    @teacher = Teacher.find(session[:user_id])
    redirect "teacher/#{@teacher.slug}"
  end

  get '/assignment/:id' do
    @assignment = Assignment.find(params[:id])
    binding.pry
      @teacher = Teacher.find(session[:user_id])
    erb :"assignment/show"
  end

  get '/assignment/:id/edit' do
    if is_logged_in?
      @assignment = Assignment.find(params[:id])
      erb :'assignment/edit'
    else
      redirect '/login'
    end
  end

  post '/assignment/:id/edit' do

    @assignment = Assignment.find(params[:id])
    @assignment.update(name: params[:name], curriculum_id: params[:curriculum_id].to_i)
    @teacher = Teacher.find(session[:user_id])
    redirect "teacher/#{@teacher.slug}"
  end

  get '/assignment/:id/delete' do
    if is_logged_in?
      Assignment.destroy(params[:id])
      @teacher = Teacher.find(session[:user_id])
      redirect "teacher/#{@teacher.slug}"
    else
      rediect '/login'
    end
  end


end
