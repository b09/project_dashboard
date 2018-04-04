require( 'sinatra' )
require('pry')
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
  # if new_proteam.check_db_match(params) == true
  #   erb (:"projectteams/exists")
  # else
    new_proteam.save
    redirect to ("/projectteams")
  # end
end
