require 'dotenv/load'
require 'bundler'
Bundler.require
# Content-Type: application/json
# Host: api.twinword.com
# X-Twaip-Key: ENV["TWAIP-KEY"]

require_relative 'models/model.rb'

# http://www.omdbapi.com

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/result' do
    puts params
    @user_mood = params[:mood]
    puts @user_mood
    
    erb :result
  end
end