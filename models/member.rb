require_relative('../db/sql_runner')

class Member

attr_reader :id
attr_accessor :first_name, :last_name, :salary, :github

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @salary = options['salary'].to_i
    @github = options['github']
  end

  def save
    sql = "
    INSERT INTO members (first_name, last_name, salary, github)
    VALUES ($1, $2, $3, $4) RETURNING id
    "
    values = [@first_name, @last_name, @salary, @github]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.all
    sql = "
    SELECT * FROM members
    "
    result = SqlRunner.run(sql)
    return result.map { |member_hash| Member.new(member_hash)  }
  end

  def self.delete(id)
    sql = " DELETE FROM members WHERE id = $1 "
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = " DELETE FROM members"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = " SELECT * FROM members WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Member.new(result.first)
  end


end
