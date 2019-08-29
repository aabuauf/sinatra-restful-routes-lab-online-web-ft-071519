class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes/new' do
    
    erb :new
  end
  

  get '/recipes' do
    @allRecipes = Recipe.all
  erb :index
  end
  
  post '/recipes' do
    @recipe = recipe.create(:name => params[:name], :content => params[:content])
    redirect to "/articles/#{@article.id}"
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
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end
  

  # delete '/recipes/:id/delete' do #delete action
  #   @recipe = Recipe.find_by_id(params[:id])
  #   @article.delete
  #   redirect to '/recipes'
  # end
end
