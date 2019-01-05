
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end


  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    redirect '/articles/3'
  end

  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    @article.update(title: params[:title], content: params[:content])
    redirect "/articles/2"
  end

  delete 'articles/:id/delete' do
    @article = Article.find_by_id(params[:id])
    @article.delete
    erb :delete
  end


end
