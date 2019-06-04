class Dog
  attr_accessor :id, :name, :breed

  # accepts a hash or keyword argument value with key-value pairs as an argument. key-value pairs need to contain id, name, and breed.
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade INTEGER
        )
        SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table

  end
end
