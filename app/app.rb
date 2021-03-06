require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  # ENV["RACK_ENV"] = 'development'

    get '/' do
      redirect '/links'
    end

    get '/links' do
      @links = Link.all
      erb :'links/index'
    end

    get '/links/new' do
      erb :'links/new'
    end

    post '/links' do
      link = Link.create(title: params[:title], url: params[:url])
      params[:tags].split(', ').each do |tag|
        link.tags << Tag.create(name: tag)
      end
      link.save
      redirect '/links'
    end

    get '/tags/:tags' do
      tag = Tag.first(name: params[:tags])
      @links = tag ? tag.links : []
      erb :'links/index'
    end

    # start the server if ruby file executed directly
    run! if app_file == $0
  end
