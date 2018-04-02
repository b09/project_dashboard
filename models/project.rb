require_relative('../db/sql_runner')

class Project

attr_reader :id
attr_accessor :name, :budget, :startdate

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @budget = options['budget'].to_i
    @startdate = options['startdate']
  end

end
