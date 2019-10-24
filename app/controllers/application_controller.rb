class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    erb :index 
  end

  get '/recipes' do 
    
    erb :index 
  end 
  post '/recipes/:id' do
   binding.pry
 end
  get '/recipes/new' do 
    erb :new
  end   
  post '/recipes/newer' do 
      binding.pry 
  end   
  
  post '/recipes' do 
  
    new_recipe = Recipe.create(params)
    id = new_recipe.id
    redirect "/recipes/#{id}"
  end
  get '/recipes/:id' do 
    
    @recipe= Recipe.find_by(params)
    erb :recipe
  end
 
  
  delete '/recipes/:id' do
    @recipe = Recipe.find(params["id"])
    @recipe.destroy
    
    redirect '/'
  end  
  get '/recipes/:id/edit' do 
    
    @recipe = Recipe.find(params["id"])
      erb :edit 
  end
  
   patch '/recipes/:id' do 
      
    id = params["id"]
    new_params = {}
    old_recipe = Recipe.find(id)
    new_params[:name] = params["name"]
    new_params[:ingredients] = params["ingredients"]
    @recipe = Recipe.find(params["id"])
    old_recipe.update(new_params)
    redirect "/recipes/#{id}"
  end 
 
  
end
