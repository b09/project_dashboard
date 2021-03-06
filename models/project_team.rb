require_relative('../db/sql_runner')

class ProjectTeam

attr_reader :id, :member_id, :project_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @project_id = options['project_id'].to_i
  end

  def save
    sql = "
    INSERT INTO projectteams (member_id, project_id)
    VALUES ($1, $2) RETURNING id
    "
    values = [@member_id, @project_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.all
    sql = "
    SELECT * FROM projectteams
    "
    result = SqlRunner.run(sql)
    return result.map { |team_hash| ProjectTeam.new(team_hash)  }
  end

  def self.delete(id)
    sql = " DELETE FROM projectteams WHERE id = $1 "
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = " DELETE FROM projectteams"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = " SELECT * FROM projectteams WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return ProjectTeam.new(result.first)
  end

  def update()
    sql = "
    UPDATE members SET (member_id, project_id) =
    ($1, $2) WHERE id = $3
    "
    values = [@member_id, @project_id, @id]
    SqlRunner.run(sql, values)
  end

  def member()
  sql = "SELECT * FROM members
  WHERE id = $1"
  values = [@member_id]
  results = SqlRunner.run( sql, values )
  return Member.new( results.first )
  end

  def project()
    sql = "SELECT * FROM projects
    WHERE id = $1"
    values = [@project_id]
    results = SqlRunner.run( sql, values )
    return Project.new( results.first )
  end

  def check_db_match()
    sql = "SELECT * FROM projectteams WHERE project_id = $1 AND member_id = $2"
    values = [@project_id, @member_id]
    results = SqlRunner.run(sql, values)
    if results.first != nil
      return true
    else
      return false
    end
  end

  # def save_array_of_members_to_project(member_array)
  #   for member_id in member_array
  #     member_id.save
  # end
  #
  # def self.add_member_to_project(member_id, project_id)
  #   sql = "
  #   INSERT INTO projectteams
  #   "
  # end
  #
  # def self.add_members_to_project(array_of_member_ids, project_id)
  #
  # end

end
