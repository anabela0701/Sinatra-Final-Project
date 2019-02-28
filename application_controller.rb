require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/model.rb'

# http://www.omdbapi.com

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/result' do
    erb :result
  end
end
