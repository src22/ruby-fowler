
puts "hello"
match = /^when_(\w*)/.match("XXwhen_alma")
puts "match: " + match.captures.last
