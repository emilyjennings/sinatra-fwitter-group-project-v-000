class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      @tweets = Tweet.all
      erb :'/tweets/tweets'
    else
      redirect to '/users/login.erb'
    end
  end

  get '/tweets/new' do
    if logged_in?
      erb :'/tweets/new'
    else
      redirect to '/users/login'
    end
  end

  post '/tweets' do
    if logged_in?
      if params[:content] == ""
        redirect "/tweets/new"
      else
        @tweet = Tweet.create(content: params[:content])
        erb :'/tweets/show'
      end
    else
      redirect "/users/login"
    end
  end

  get "/tweets/:id" do
    if logged_in?
      @tweet = Tweet.find(params[:id])
      redirect '/tweets/#{tweets.id}'
    else
      redirect "/users/login"
    end
  end

  post '/tweets/:id' do
    redirect '/tweets/#{tweets.id}'

    if logged_in?
      @tweets = Tweet.all
      erb :'/tweets/tweets'
    else
      redirect to '/users/login'
    end

  end

  get '/tweets/:id/edit' do
    @tweet = Tweet.find(params[:id])
    erb :'/tweets/edit'
  end

  patch '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    erb :'/tweets/show'
  end

  delete '/tweets/:id/delete' do
    if logged_in?
      @tweet = Tweet.find(params[:id])
      @tweet.destroy
      redirect '/tweets/tweets'
    else
      erb :'/users/login'
    end
  end

end
