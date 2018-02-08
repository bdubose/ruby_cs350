# Branwin DuBose, Josh Echols
#




# This program takes one argument (the file name)
filename = ARGV[0]

if ARGV.length == 1
  if File.exist? filename
    puts 'File found!'
    analyzer = Analyzer.new(filename)
  else
    puts 'ERROR: The given filename does not exist.'
  end
else
  puts 'ERROR: Missing  required filename argument!'
end