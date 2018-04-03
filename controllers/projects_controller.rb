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

get '/projects/:id/edit' do
  @project = Project.find(params['id'].to_i)
  erb( :"/projects/edit" )
end

get '/projects/:id' do
  @project = Project.find(params['id'].to_i)
  erb( :"/projects/show" )
end

post '/projects' do
  new_project = Project.new(params)
  new_project.save
  redirect to ("/projects")
end

post '/projects/:id' do
  project = Project.new(params)
  project.update
  redirect to ("/projects/#{params['id']}")
end
