# require 'rubygems'
# require 'sqlite3'

# db = SQLite3::Database.open('flatiron.db')

# db.execute("INSERT INTO students(name)
# 	VALUES ('name'), ('name');	")

# db.execute("NSERT INTO	 bio (students_id, tagline, content)
# 	VALUES(student_id, 'tagline', content),")

# db.execute("INSERT INTO apps (students_id, name, link, description)
# 	VALUES(students_id, app_name, description), ")
# db.execute("INSERT INTO social ( students_id, name, username, link)
# 	VALUES
# (2, 'twitter', 'evenstephen', 'http://www.twitter.com/evenstephen'),")

def insert_student(name, tagline, content) 
	db.execute("INSERT INTO students(name,tagline, content)
	VALUES ('#{name}',#{tagline}, #{content})")
end
def find_id(name)
	db.execute("SELECT id FROM students
	WHERE students.name = #{name}")
end

def insert_apps(student_id, name, link, description)
	db.execute("INSERT INTO apps(student_id, name, link, description)
		VALUES(#{student_id}, #{name}, #{link}, #{description}")
end

def insert_social(student_id, name, username, link)
	db.execute("INSERT INTO social(student_id, name, username, link)
		VALUES(#{student_id}, #{name}, #{username}, #{link}")
end