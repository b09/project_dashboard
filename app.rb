require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/members_controller')
require_relative('controllers/projects_controller')
require_relative('controllers/project_teams_controller')
# require_relative('controllers/members_controller')

get '/' do
  erb(:index)
end
