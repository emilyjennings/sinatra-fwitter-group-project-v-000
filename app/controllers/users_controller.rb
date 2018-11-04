require 'pry'
class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
     erb :'/users/signup'
   else
     redirect '/tweets/show'
   end
  end

  post '/signup' do
     if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user= User.create(username: params[:username], password: params[:password], email: params[:email])
      session[:user_id] = @user.id
      redirect '/tweets'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
     redirect '/tweets'
   end
  end

  post '/login' do

   @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/tweets'
    else
      redirect to '/signup'
    end
  end


end
