require 'sqlite3'
require 'rubygems'




class Students
	@db = SQLite3::Database.open('flatiron.db')

	attr_accessor :name, :tagline, :bio, :photo, :id

	 def initialize(raw_data)
	 	@id = raw_data[0]		
	 	@name = raw_data[1]
	 	@tagline = raw_data[2]
	 	@bio = raw_data[3]
	 	@photo = raw_data[4]

	 end

	def self.find(id)
 		raw_data = @db.execute("SELECT * FROM students WHERE id = #{id}").flatten
 		s = Students.new(raw_data)
 	end


	def self.find_name(name)
		name = name.split.map{|name| name.capitalize}.join(' ')
 		raw_data = @db.execute("SELECT * FROM students WHERE name = '#{name}'").flatten
 		s = Students.new(raw_data)
 	end

end


# a = Student.new #=> #<Student>
# a.name = "Avi Flombaum"
# a.name #=> "Avi Flombaum"

	
# Student.find(1)

# end
#<Student>