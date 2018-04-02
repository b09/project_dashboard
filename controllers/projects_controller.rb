require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/project')

get '/projects' do
  @projects = Project.all
  erb(:"projects/index")
end
