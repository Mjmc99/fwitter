require './config/environment'
require './app/models/tweet'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @tweets = Tweet.all
    # Tweet.new("Vanessa", "My first tweet! SO EXCITING OMG!!!")
    # Tweet.new("Vanessa", "My second tweet! Still super exciting!!!")
    # Tweet.new("Vanessa", "A third tweet! ZOMG!!!")
      erb :index
  end

  get '/tweet' do
    erb :tweet
  end

  post '/tweet' do
    # puts params
    # binding.pry
    #dont need this yet @newtweet = 
    tweet = Tweet.new({:user => params[:user], :status => params[:status]})
    tweet.save
    redirect '/'
  end

end