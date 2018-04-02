require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/project')

get '/projects' do
  @projects = Project.all()
  erb( :"projects/index" )
end

get '/projects/new' do
  erb(:"projects/new")
end

post '/projects' do
  new_project = Project.new(params)
  new_project.save
  redirect to ("/projects")
end
