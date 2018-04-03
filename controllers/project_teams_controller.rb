require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/project')
require_relative( '../models/member' )
require_relative('../models/project_team')

get '/projectteams' do
  @proteams = ProjectTeam.all()
  @members = Member.all
  @projects = Project.all 
  erb ( :"projectteams/index" )
end

get '/projectteams/new' do
  @members = Member.all
  @projects = Project.all
  erb(:"projectteams/new")
end

post '/projectteams' do
  new_proteam = ProjectTeam.new(params)
  new_proteam.save
  redirect to ("/projectteams")
end
