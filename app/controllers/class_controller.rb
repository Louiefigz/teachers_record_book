class ClassController < ApplicationController

  get '/class/new' do
    if is_logged_in?
      @teacher = Teacher.find(session[:user_id])
        erb :'class/new'
    else
      redirect "/login"
    end
  end

  post '/class/new' do
    @teacher = ClassName.create_new_class(session,params)
    redirect "teacher/#{@teacher.slug}"
  end

  get '/class/:id' do
    if is_logged_in?
      @class = ClassName.find(params[:id])
      erb :'class/show'
    else
      redirect '/login'
  end

  get '/class/:id/edit' do
    if is_logged_in?
      @class = ClassName.find(params[:id])
      erb :'class/edit'
    else
      redirect '/login'
    end
  end

  post '/class/:id/edit' do
    @class = ClassName.find(params[:id])
    @class.update(name: params[:name])
    params[:student].each do |student|
      if student[:name] != ""
        new_student = Student.find_or_create_by(student)
        StudentTeacherClass.create(class_name_id: @class.id, student_id: new_student.id)
      end
    end
    @teacher = Teacher.find(session[:user_id])
    redirect "teacher/#{@teacher.slug}"
  end

  get '/class/:id/delete' do
    if is_logged_in?
      ClassName.destroy(params[:id])
      @teacher = Teacher.find(session[:user_id])
      redirect "teacher/#{@teacher.slug}"
    else
      redirect '/login'
    end
  end


end
