class StudentController < ApplicationController
require 'pry'

    get '/student/new' do
      binding.pry
      @teacher = Teacher.find(session[:user_id])
      erb :'student/new'
    end

    post '/student/new' do
      @student = Student.find_or_create_by(name: params[:name].strip)
      StudentTeacherClass.create(class_name_id: params[:class_name_id], student_id: @student.id)
      @teacher = Teacher.find(session[:user_id])
      redirect "teacher/#{@teacher.slug}"
    end

    get '/student/:id' do
      @student = Student.find(params[:id])
      @teacher = Teacher.find(session[:user_id])
      erb :'student/show'
    end

    get '/student/:id/edit' do
      binding.pry
      @student = Student.find(params[:id])
      @teacher = Teacher.find(session[:user_id])
      erb :'student/edit'
    end

    post '/student/:id/edit' do
      binding.pry
      @student = Student.find(params[:id])
      @student.update(name: params[:name])
      @teacher = Teacher.find(session[:user_id])
      redirect "teacher/#{@teacher.slug}"
    end

  get '/student/:id/delete' do
    @student = Student.find(params[:id])
    @student.destroy
    @teacher = Teacher.find(session[:user_id])
    redirect "teacher/#{@teacher.slug}"

  end

end
