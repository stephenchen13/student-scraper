require 'rubygems'
require 'nokogiri'
require 'open-uri'

all_css = Nokogiri::HTML(open("http://students.flatironschool.com/css/matz.css"))   
my_css = all_css.css("p")[0].text.match(/.kevinc-profile-photo\s*{(\s|.)*?}/)
# .match(/kevinc-profile-photo\s*{(.*)}/)
my_css.to_s.match(/\.\.(.*)?\)/)
# puts image
puts $1