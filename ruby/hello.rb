#!/usr/bin/env ruby
#
# Hello Ruby World!
#

animals = ["camel", "llama", "owl"]
fruit_color = { "apple" => "red", "banana" => "yellow" }

verinfo = `git describe --abbrev=7 --dirty --always --tags`

puts "Hello Ruby World!  Version: #{verinfo}"
print "Command line args: "
ARGV.each do |arg|
	print "#{arg} "
end
print "\n"

# print out our animals array reverse sorted...
(animals.reverse).each do |i|
	print "item = ", i, "\n"
	if i == animals.first
		print 'Condition is True, "camel" == ', i, "\n" 
	else
		print 'Condition is False, "camel" != ', i, "\n" 
	end
end

# print out our Ruby hash 
fruit_color.each do |key, value|
	print key, " = ", value, "\n"
end

# Let's create the file test.out and write animals array to it...
file = File.new("test.out", "w")
animals.each do |i|
	file.syswrite("#{i}\n")
end
file.close

# Now open the file we wrote and read it back...
filelines = IO.readlines("test.out")
filelines.each do |i|
	print i
end

