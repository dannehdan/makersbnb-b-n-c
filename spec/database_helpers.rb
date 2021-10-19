require "pg"

def persisted_data(id:)
  connection = PG.connect(dbname: "makersbnb _test")
  result = connection.query("SELECT * FROM rooms WHERE id = #{id};")
  result.first
end
