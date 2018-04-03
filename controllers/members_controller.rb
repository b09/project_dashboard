require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member' )
require_relative('../models/project_team')

get '/members' do
  @members = Member.all()
  erb ( :"members/index" )
end

get '/members/new' do
  erb(:"members/new")
end

get '/members/:id/edit' do
  @member = Member.find(params['id'].to_i)
  erb( :"members/edit" )
end

get '/members/:id' do
  @member = Member.find(params['id'].to_i)
  erb( :"/members/show" )
end

post '/members' do
  new_member = Member.new(params)
  new_member.save
  redirect to ("/members")
end

post '/members/:id' do
  member = Member.new(params)
  member.update
  redirect to ("/members/#{params['id']}")
end


post '/members/:id/delete' do
  Member.delete(params[:id])
  redirect to ("/members")
end
