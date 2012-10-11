require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'sqlite3'

# open index to get all profile links
index_page = Nokogiri::HTML(open("http://students.flatironschool.com/"))   
links = index_page.css("div.one_third a").map { |link| link["href"] }
# billy's profile doesnt match
links.delete("billymizrahi.html")

links.each do |link|
	student_page = Nokogiri::HTML(open("http://students.flatironschool.com/" << link.to_s)) 
	name_selector = student_page.css("div.two_third h1")[0]
	name = name_selector.text unless name_selector.nil?

	tagline_selector = student_page.css("h2#tagline")[0]
	tagline = tagline_selector.text unless tagline_selector.nil?

	description_selector = student_page.css("div.two_third p:first")[0]
	description = description_selector.text unless description_selector.nil?

	# photo is in CSS, can we get this?
	# image_selector = student_page.css("div#navcontainer img")[0]
	# image = image_selector["src"]

	email_selector = student_page.css("li.mail a")[0]
	email = email_selector["href"].gsub("mailto:", "") unless email_selector.nil?

	blog_selector = student_page.css("li.blog a")[0]
	blog = blog_selector["href"] unless blog_selector.nil?

	linkedin_selector = student_page.css("li.linkedin a")[0]
	linkedin = linkedin_selector["href"] unless linkedin_selector.nil?

	twitter_selector = student_page.css("li.twitter a")[0]
	twitter = twitter_selector["href"] unless twitter_selector.nil?
		
	coder_links = student_page.css(".coder-cred a")
	coder_links.each do |code_link|
		code_link["href"]
		code_link.css("div")[0]["class"].gsub("cred-", "")
	end

	apps_selector = student_page.css("div.two_third div.one_third")
	apps_selector.each do |app_div|
		app_name = app_div.css("h4").text
		description = app_div.css("p").text
	end
	# puts blog << " " << linkedin << " " << twitter
	# puts name << " " << description
end
# puts index_page.class   # => Nokogiri::HTML::Document



# # Open a database
# db = SQLite3::Database.new "test.db"

# # Create a database
# rows = db.execute <<-SQL
#   create table numbers (
#     name varchar(30),
#     val int
#   );
# SQL

# # Execute a few inserts
# {
#   "one" => 1,
#   "two" => 2,
# }.each do |pair|
#   db.execute "insert into numbers values ( ?, ? )", pair
# end

# # Find a few rows
# db.execute( "select * from numbers" ) do |row|
#   p row
# end

#identify data that we can scrape

# title
# tagline
# description
# photo
# links:
# 	mail
# 	blog
# 	linkedin
# 	twitter
# favorite apps:
# 	name
# 	description
# coder cred:
# 	name
# 	link
# social nerdery
# 	do we need this stuff?