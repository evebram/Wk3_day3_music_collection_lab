require('pg')
require_relative('../db/sql_runner.rb')
require_relative('albums.rb')


class Artist

  attr_reader :id, :name

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name)
           VALUES ($1)
           RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist)}
  end

  def update()
  sql = "UPDATE artists SET (
         name
         ) =
        ($1)
        WHERE id = $2"
  values = [@name, @id]
  SqlRunner.run(sql, values)
end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end


end
