#!/usr/bin/ruby

require 'date'

puts 'Hello world'


# User input
# puts 'Welcome!'
# print 'Name? '
# name = gets.chomp

# print 'Age? '; age = gets.chomp


# String formatting
# puts "#{name}, you're only #{age} years old?!"
# puts 'Name: %s Age: %s' % [name, age]


# Functions
def hello_world
  puts 'Hello World.'
end

def greet_user(name)
  puts "Hello, #{name}"
end

hello_world
greet_user('Branwin')

# Array
names = ['Programming Languages', 'Operating Systems', 'Probability and Statistics', 'Linear Algebra']
puts names
for n in names.sort
  greet_user n
end

# Hashes
h = { a: 100, b: 200}
puts "#{h[:a]}"
puts "#{h[:b]}"


print 'Yo, What is yo first name? ' ; fname = gets.chomp
print 'Yo, hate to bother ya again, but what is yo last name? '; lname = gets.chomp
puts "Ohhhhhh, #{lname} #{fname}? Wait! No! #{fname} #{lname}"

puts DateTime.now().strftime('%Y-%m-%d %H:%M')


arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
arr << arr[4]
arr.unshift arr[5]
arr.pop
arr << arr[6]
arr.uniq!
puts arr
