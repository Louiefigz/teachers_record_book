require './config/environment'
require 'shotgun'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end


  helpers do
    def redirect_if_not_logged_in
      if !is_logged_in?
        redirect "/login"
      end
    end

    def current_user
      User.find(session["user_id"])
    end

    def is_logged_in?
       !!session[:user_id]
    end
  end

end
