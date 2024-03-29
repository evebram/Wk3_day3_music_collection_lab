require('pg')
require_relative('../db/sql_runner.rb')
require_relative('artists.rb')

class Album

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title,
           genre,
           artist_id)
           VALUES ($1, $2, $3)
           RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album)}
  end

  def self.find(id)
    sql = "SELECT * FROM albums
           WHERE artist_id = $1"
    values = [id]
    album = SqlRunner.run(sql, values)
    return album.map{ |album| Album.new(album) }
  end

  def update()
  sql = "UPDATE albums SET (
         title,
         genre,
         artist_id
         ) =
        ($1, $2, $3)
        WHERE id = $4"
  values = [@title, @genre, @artist_id, @id]
  SqlRunner.run(sql, values)
end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def artist()
    sql = "SELECT * FROM artists
           WHERE id = $1"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)
    artist_hash = result.first
    artist = Artist.new(artist_hash)
    return artist
  end

end
