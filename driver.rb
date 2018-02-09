# Branwin DuBose, Josh Echols
# CS 401
# Ruby Assignment

# This driver program takes one argument (the file name)
filename = ARGV[0]

if ARGV.length == 1
  if File.exist? filename
    puts 'File found!'

    string_contents = ''
    file = File.open(filename)

    file.each_line do |line|
      string_contents += line
    end

    .new(string_contents)
  else
    puts 'ERROR: The given filename does not exist.'
  end
else
  puts 'ERROR: Missing  required filename argument!'
end