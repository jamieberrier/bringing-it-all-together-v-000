class Dog
  attr_accessor :id, :name, :breed

  # accepts a hash or keyword argument value with key-value pairs as an argument. key-value pairs need to contain id, name, and breed.
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
        )
        SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
     DROP TABLE dogs
     SQL
   DB[:conn].execute(sql)
  end

  def save

  end

  def update
    sql = "UPDATE songs SET name = ?, album = ? WHERE name = ?"
    DB[:conn].execute(sql, self.name, self.album, self.name)
  end
end
