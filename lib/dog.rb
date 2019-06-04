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
    if self.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO dogs (name, breed)
        VALUES (?, ?)
      SQL
      DB[:conn].execute(sql, self.name, self.breed)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    end
    self
  end

  def update
    sql = "UPDATE dogs SET name = ?, breed = ? WHERE id = ?"
    DB[:conn].execute(sql, self.name, self.album, self.id)
  end

  def self.create(attributes)
    self.new(attributes).save
  end

  def self.find_by_id(id)
    sql = <<-SQL
      SELECT *
      FROM dogs
      WHERE id = ?
      LIMIT 1
    SQL
    
    db.execute(sql, id).map do |row|
      @name = row[1]
      @type = row[2]
      @hp = row[3]
    end

    DB[:conn].execute(sql, id).map do |row|
      @name = row[]
      @breed = row[]
    end
  end

end
