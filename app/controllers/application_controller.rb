class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    @allRecipes = Recipe.all
  erb :index
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end
  
  patch '/recipes/:id' do #edit action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.title = params[:title]
    @recipe.content = params[:content]
    @recipe.save
    redirect to "/articles/#{@article.id}"
  end
  
  # delete '/recipes/:id/delete' do #delete action
  #   @recipe = Recipe.find_by_id(params[:id])
  #   @article.delete
  #   redirect to '/recipes'
  # end
end
