require_relative('../db/sql_runner')

class Member

attr_reader :id
attr_accessor :name, :salary, :github

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @salary = options['salary'].to_i
    @github = options['github']
  end

end
