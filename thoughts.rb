# projects_controller.rb

post '/projects/:id' do
  project = Project.new(params)
  project_team = ProjectTeam.new(params)
  members = Member.all()

  id_of_members_to_add = []
  for member in members
    key_for_member = "member-" + member.id.to_s
    if params[key_for_member]
      id_of_members_to_add << params[key_for_member]
    end
  end
  project.update
  redirect to ("/projects/#{params['id']}")
end

# projects/new.rb

# <div class="form-el">
#   <label for="start_date">Select start date:</label>
#   <input type="date" name="start_date" id="start_date">
# </form>
#
# <p>Select what staff to add:</p>
# <ul>
#   <%for member in @members%>
#     <p> <%= member.first_name %> <input type="checkbox" name="member-<%= member.id %>" value="true"/> </p>
#   <% end %>
# </ul>
#
# <div class="form-el">
#   <input type="submit" value="Create Project"/>
# </div>


# project_teams/new
<form action="/projectteams" method="post">

    <p>Select what staff to add:</p>

    <select>
      <% for project in @projects%>
      <option value="" selected disabled hidden>Please select a name</option>
      <option value="1" name="project_id"> <%= project.name%> </option>
      <% end %>
    </select>

    <select>
      <option value="" disabled="disabled" selected="selected">Please select a name</option>
      <% for member in @members%>
      <option value="1" name="member_id"> <%= member.first_name%> </option>
      <% end %>
    </select>

    <div class="form-el">
      <input type="submit" value="Add Member to Team"/>
    </div>

</form>
