require_relative('../db/sql_runner')

class Project

attr_reader :id
attr_accessor :name, :budget, :start_date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @budget = options['budget'].to_i
    @start_date = options['start_date']
  end

  def save
    sql = "
    INSERT INTO projects (name, budget, start_date)
    VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @budget, @start_date]
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

end
