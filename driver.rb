# Branwin DuBose, Josh Echols
# CS 401
# Ruby Assignment

# This driver program takes one argument (the file name)

require './analyzer'
require './tokenizer'

filename = ARGV[0]

if ARGV.length == 1
  if File.exist? filename
    puts 'File found!'

    string_contents = ''
    file = File.open(filename)

    file.each_line do |line|
      string_contents += (line + '\n')
    end

    tokenizer = SimpTokenizer.new(string_contents)
    analyzer = Analyzer.new(tokenizer)

    valid = analyzer.valid_program?

    if valid
      puts "#{filename} is a valid SimPL program. Congrats."
    else
      puts "#{filename} has an error."
    end

  else
    puts 'ERROR: The given filename does not exist.'
  end
else
  puts 'ERROR: Missing  required filename argument!'
end