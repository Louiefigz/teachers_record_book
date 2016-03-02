class AssignmentController < ApplicationController

  get '/assignment/new' do
    redirect_if_not_logged_in

      @teacher = Teacher.find(session[:user_id])
      binding.pry
      erb :'assignment/new'
  end

  post '/assignment/new' do
    @assignment = Assignment.create(params)
    @teacher = Teacher.find(session[:user_id])
    redirect "teacher/#{@teacher.slug}"
  end

  get '/assignment/:id' do
    redirect_if_not_logged_in
    @assignment = Assignment.find(params[:id])
    binding.pry
      @teacher = Teacher.find(session[:user_id])
    erb :"assignment/show"
  end

  get '/assignment/:id/edit' do
  redirect_if_not_logged_in
      @assignment = Assignment.find(params[:id])
      erb :'assignment/edit'

  end

  post '/assignment/:id/edit' do

    @assignment = Assignment.find(params[:id])
    @assignment.update(name: params[:name], curriculum_id: params[:curriculum_id].to_i)
    @teacher = Teacher.find(session[:user_id])
    redirect "teacher/#{@teacher.slug}"
  end

  get '/assignment/:id/delete' do
      redirect_if_not_logged_in
      Assignment.destroy(params[:id])
      @teacher = Teacher.find(session[:user_id])
      redirect "teacher/#{@teacher.slug}"
  end


end
