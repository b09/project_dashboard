require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/project')
require_relative('../models/project_team')
require_relative('../models/member')
require('pry')

get '/projects' do
  @projects = Project.all()
  @members = Member.all()
  erb( :"projects/index" )
end

get '/projects/new' do
  @members = Member.all()
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

post '/projects/:id/delete' do
  Project.delete(params[:id])
  redirect to ("/projects")
end

post '/projects/:id' do
  project = Project.new(params)
  members = Member.all()
  project.update
  redirect to ("/projects")
end
