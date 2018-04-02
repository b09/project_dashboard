require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member' )

get '/members' do
  @members = Member.all()
  erb ( :"members/index" )
end

get '/members/new' do
  erb(:"members/new")
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
