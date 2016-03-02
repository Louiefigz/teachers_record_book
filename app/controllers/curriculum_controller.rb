class CurriculumController < ApplicationController

  get '/curriculum/new' do
    redirect_if_not_logged_in
      @teacher = Teacher.find(session[:user_id])
      erb :'curriculum/new'
  end

  post '/curriculum/new' do

    @curriculum = Curriculum.create(params)
    @teacher = Teacher.find(session[:user_id])
    redirect "teacher/#{@teacher.slug}"
  end

  get '/curriculum/:id' do
    redirect_if_not_logged_in
      @curr = Curriculum.find(params[:id])
      @teacher = Teacher.find(session[:user_id])
      erb :'/curriculum/show'
  end

  get '/curriculum/:id/edit' do
    redirect_if_not_logged_in
    @curriculum = Curriculum.find(params[:id])
    erb :"curriculum/edit"
  end

  post '/curriculum/:id/edit' do

    @curriculum = Curriculum.find(params[:id])
    @curriculum.update(name: params[:name], class_name_id: params[:class_name_id].to_i)
    @teacher = Teacher.find(session[:user_id])
    redirect "teacher/#{@teacher.slug}"
  end

  get '/curriculum/:id/delete' do
    Curriculum.destroy(params[:id])
    @curriculum = Curriculum.create(params)
    @teacher = Teacher.find(session[:user_id])
    redirect "teacher/#{@teacher.slug}"
  end
end
