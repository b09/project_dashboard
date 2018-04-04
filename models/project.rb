require_relative('../db/sql_runner')

class Project

attr_reader :id
attr_accessor :name, :budget, :start_date, :type, :description

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @budget = options['budget'].to_i
    @type = options['type']
    @start_date = options['start_date']
    @description = options['description']
  end

  def save
    sql = "
    INSERT INTO projects (name, budget, start_date, type, description)
    VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@name, @budget, @start_date, @type, @description]
    pg_hash = SqlRunner.run(sql, values)
    @id = pg_hash.first['id'].to_i
  end

  def self.all
    sql = "
    SELECT * FROM projects
    "
    result = SqlRunner.run(sql)
    return result.map { |project| Project.new(project) }
  end

  def self.delete(id)
    sql = " DELETE FROM projects WHERE id = $1 "
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = " DELETE FROM projects"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = " SELECT * FROM projects WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Project.new(result.first)
  end

  def update()
    sql = "
    UPDATE projects SET (name, budget, start_date, type, description) =
    ($1, $2, $3, $4, $5) WHERE id = $6
    "
    values = [@name, @budget, @start_date, @type, @description, @id]
    SqlRunner.run(sql, values)
  end

  def members
    sql = "SELECT * FROM members INNER JOIN projectteams ON
    projectteams.member_id = members.id WHERE projectteams.project_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member) }
  end



end
