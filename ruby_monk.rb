# Ruby Monk - Ruby Primer
a = 1
b = 4
puts "The number #{a} is less than #{b}"

def string_length_interpolater(incoming_string)
  "The string you just gave me has a length of #{incoming_string.length}"
end

puts string_length_interpolater("hello")

puts "[Luke:] I can’t believe it. [Yoda:] That is why you fail.".include?('Yoda')

puts "Ruby is a beautiful language".start_with?("Ruby")

puts "I can't work with any other language but Ruby".end_with?('Ruby')

puts "I am a Rubyist".index("R")

puts "ThiS iS A vErY ComPlEx SenTeNcE".swapcase.downcase.upcase

puts 'Fear is the path to the dark side'.split(" ").inspect

puts "Ruby" + "Monk" + "Ruby".concat("Monk") + "Ruby" << "Monk"
#Global substitution with regEx
puts "RubyMonk".gsub(/[aeiou]/, '_')
puts 'RubyMonk Is Pretty Brilliant'.gsub(/[A-Z]/, '0')

puts 'RubyMonk Is Pretty Brilliant'.scan(/\b\w/).inspect

#Control structure
def check_sign(number)
  if number > 0
    "#{number} is positive"
  elsif number == 0
    "#{number} is zero"
  else
    "#{number} is negative"
  end
  # Ternary operator version of the above code:
  #number > 0 ? "#{number} is positive" : "#{number} is negative"   
end

puts check_sign(5)
puts check_sign(-3)
puts check_sign(0)
# map/collect array method
puts [1, 2, 3, 4, 5].map { |i| i * 3 }.inspect

# select array method
puts [1, 2, 3, 4, 5].select { |i| i.even? }.inspect
names = ['rock', 'paper', 'scissors', 'lizard', 'spock']
puts names.select {|name| name.length > 5}.inspect
#Array delete and delete_if methods
puts [1, 2, 3, 4, 5].delete(3)
puts [1,2,3,4,5,6,7].delete_if{|i| i < 4 }.inspect

# for loop with array
def array_copy(source)
  destination = []
  for i in source
    if i < 4
      destination.push(i)
    end
  end
  return destination
end
puts array_copy([1, 2, 3, 4, 5]).inspect

# each method
def array_copy(source)
  destination = []
  source.each do |i|
    if i < 4
      destination.push(i)
    end
  end
  return destination
end
puts array_copy([1, 2, 3, 4, 5]).inspect

#Ruby Hash
puts restaurant_menu = {
  "Ramen" => 3,
  "Dal Makhani" => 4,
  "Tea" => 2
}["Tea"]

restaurant_menu = { "Ramen" => 3, "Dal Makhani" => 4, "Coffee" => 2 }
restaurant_menu.each do | item, price |
  restaurant_menu[item] = (price + price * 0.10).round(2)
    puts "#{item}: $#{restaurant_menu[item]}"
end

# Hash object keys and values methods
restaurant_menu = { "Ramen" => 3, "Dal Makhani" => 4, "Coffee" => 2 }
puts restaurant_menu.keys.inspect
puts restaurant_menu.values.inspect
#still hashing
def artax
  a = [:punch, 0]
  b = [:kick, 72]
  c = [:stops_bullets_with_hands, false]
  key_value_pairs = [a, b, c ]
  Hash[key_value_pairs]
end
p artax

# Getting Classy
class Rectangle
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def perimeter
    2 * (@length + @breadth)
  end
  
  def area
    @length * @breadth
  end
end
# Create two instances of Rectangle
rectangle1 = Rectangle.new(11, 9)
rectangle2 = Rectangle.new(4, 6)

# Calculate and print the perimeter and area for rectangle1
puts "Rectangle 1: Length: 5, Breadth: 3"
puts "Perimeter = #{rectangle1.perimeter}"
puts "Area = #{rectangle1.area}"

# Calculate and print the perimeter and area for rectangle2
puts "Rectangle 2: Length: 7, Breadth: 4"
puts "Perimeter = #{rectangle2.perimeter}"
puts "Area = #{rectangle2.area}"
#method
def introduction(age, gender, *names)
  "Meet #{names.join(' ')}, who's #{age} and #{gender}"
end
puts introduction(35, "Male", "Luke", "Skywalker")

# Naming parameters
def add(*numbers)
  numbers.inject(0) { | sum, number | sum + number }
end
def subtract(*numbers) 
  first_number = numbers.shift
  numbers.inject(first_number) { | first_number, number | first_number - number }
end
def calculate(*arguments)
  # if the last argument is a Hash, extract it 
  # otherwise create an empty Hash
  options = arguments[-1].is_a?(Hash) ? arguments.pop : {}
  options[:add] = true if options.empty?
  return add(*arguments) if options[:add]
  return subtract(*arguments) if options[:subtract]
end
puts add(2,4,7)
puts subtract(2,4,7)
puts calculate(2,4,7, add: true)
puts calculate(2,4,7, subtract: true)

# lambda
increment = lambda { |x| x + 1 }
puts increment.call(2)
def calculate(*numbers)
  yield(numbers)
end
puts calculate(2, 3) { |a, b| a + b }

# Module(Interface)
module Perimeter
  def perimeter
    sides.inject(0) { | side, sum | side + sum }
  end
end

class Rectangle
  include Perimeter

  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def sides
    [@length, @breadth, @length, @breadth]
  end
end

class Square
  include Perimeter

  def initialize(side)
    @side = side
  end

  def sides
    [@side, @side, @side, @side]
  end
end

rectangle = Rectangle.new(5, 3)
square = Square.new(4)

puts "Rectangle Perimeter: #{rectangle.perimeter}"
puts "Square Perimeter: #{square.perimeter}"

# Namespacing
module RubyMonk
  module Parser
    class TextParser
      def self.parse(str)
        # returns an array of alphabets
        str.upcase.split("")
      end
    end
  end
end
p RubyMonk::Parser::TextParser.parse("RubyMonk")

# File system
File.open("disguise", "w") do |f|
  f.write "Bar"
end
puts File.read("disguise")

#palindrome
def palindrome?(sentence)
  cleaned_string = sentence.gsub(" ", "").downcase
  cleaned_string == cleaned_string.reverse
end
puts palindrome?("Never odd or even")

# Array length
def array_length(strings)
  lengths = []
  strings.each do |string|
    lengths << string.length
  end
  lengths
end
# Using map method
def array_length2(strings)
  strings.map { |string| string.length }
end
puts array_length(["Ruby", "Rails", "C42"]).inspect
puts array_length2(["heaven", "guten", "always"]).inspect

#Find frequencies
def find_frequencies(sentence, word)
  sentence.downcase.split.count(word.downcase)
end
puts find_frequencies("Ruby is awesome", "ruby")

# Sort string in ascending order
def sort_string(string)
  string.split.sort { | x, y | x.length <=> y.length }.join(" ")
end
puts sort_string("Awesome I am")

# random number
def random_select(array, n)
  result = []
  n.times do
    result << array[rand(array.length)]
  end
  result
end
puts random_select([1,2,3,4,4,5,6,7], 3).inspect

# Boolean Expressions in Ruby
#is_an_experienced_programmer = (candidate.languages_worked_with.include? 'Ruby') && (candidate.years_of_experience >= 2 || candidate.github_points >= 500) && !(candidate.applied_recently? || candidate.age < 15)

#Compute sum of cubes for given range
def sum_of_cubes(a, b)
  (a..b).inject(0) { |sum, x| sum += x**3 }
end
puts sum_of_cubes(1, 5)

#Find non-duplicate values in an Array
def non_duplicate_values(arr)
  arr.find_all { |x| arr.count(x) == 1 }
end
p non_duplicate_values([1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5])

#Check if all elements in an array are Fixnum
def all_fixnum?(array)
  fixnum_class = defined?(Fixnum) ? Fixnum : Integer
  array.all? { |x| x.is_a? fixnum_class }
end
puts all_fixnum?([1, 2, 3, 4, 5])

#Kaprekar's Number
def Kaprekar?(k)
  square = (k ** 2).to_s
  no_of_digits = k.to_s.size
  second_half = square[-no_of_digits..-1].to_i
  first_half = square.size.even? ? square[0..no_of_digits-1].to_i : square[0..no_of_digits-2].to_i
  k == first_half + second_half
end
puts Kaprekar?(9)

# Enough Contrast?
#Problem Statement
#For 2 Colors in RGB:
#(R1, G1, B1) and (R2, G2, B2),

#Brightness index is:
#( 299*R1 + 587*G1 + 114*B1) / 1000

#Brightness difference is:
#Absolute difference in brighness indices

#Hue difference is:
#|R1 - R2| + |G1 - G2| + |B1 - B2|
#where |x| is the absolute value of x

#If Brightness difference is more than 125 and the Hue difference is more than 500 then the colors have sufficient contrast

#Find out if the given color combos have sufficient contrast and get all the tests passing.

class Color
  attr_reader :r, :g, :b
  def initialize(r, g, b)
    @r = r
    @g = g
    @b = b
  end

  def brightness_index
    ( 299*r + 587*g + 114*b) / 1000
  end

  def brightness_difference(another_color)
    (brightness_index - another_color.brightness_index).abs
  end

  def hue_difference(another_color)
    ((r - another_color.r).abs + (g - another_color.g).abs + (b - another_color.b).abs)
  end

  def enough_contrast?(another_color)
    (brightness_difference(another_color) > 125 && hue_difference(another_color) > 500)
  end
end
# Initialize three Color objects
color1 = Color.new(600, 520, 400)
color2 = Color.new(250, 255, 150)
color3 = Color.new(450, 100, 255)

# Test brightness_index
puts "Brightness index of color1: #{color1.brightness_index}"
puts "Brightness index of color2: #{color2.brightness_index}"
puts "Brightness index of color3: #{color3.brightness_index}"

# Test brightness_difference
puts "Brightness difference between color1 and color2: #{color1.brightness_difference(color2)}"
puts "Brightness difference between color1 and color3: #{color1.brightness_difference(color3)}"

# Test hue_difference
puts "Hue difference between color1 and color2: #{color1.hue_difference(color2)}"
puts "Hue difference between color1 and color3: #{color1.hue_difference(color3)}"

# Test enough_contrast?
puts "Do color1 and color2 have enough contrast? #{color1.enough_contrast?(color2)}"
puts "Do color1 and color3 have enough contrast? #{color1.enough_contrast?(color3)}"

#Time to run code
def exec_time(proc)
  start_time = Time.now
  proc.call
  Time.now - start_time
end

# Test 1: Repeating a task 10 times
task_10_times = Proc.new do
  10.times do
    (1..1_000_000).each { |i| i + 1 }
  end
end

single_task = Proc.new do
  (1..1_000_000).each { |i| i + 1 }
end

puts "Task 10 times takes more time: #{exec_time(task_10_times) > exec_time(single_task)}"

# Test 2: Division takes more time than addition
division = Proc.new { 1_000_000.times { |i| i / 2.0 } }
addition = Proc.new { 1_000_000.times { |i| i + 1 } }

puts "Division takes more time than addition: #{exec_time(division) > exec_time(addition)}"

# Test 3: Array#find takes more time than Array#[]
array = (1..1_000_000).to_a

array_find = Proc.new { 100.times { array.find { |x| x == 999_999 } } }
array_index = Proc.new { 100.times { array[999_999] } }

puts "Array#find takes more time than Array#[]: #{exec_time(array_find) > exec_time(array_index)}"

#Number shuffle
def number_shuffle(number)
  digits = number.to_s.chars
  permutatiuons = digits.to_a.permutation.map(&:join).map(&:to_i)
  permutatiuons.uniq.sort
end
puts number_shuffle(435).inspect

#Orders and costs
class Restaurant
  def initialize(menu)
    @menu = menu
  end

  def cost(*orders)
    orders.inject(0) do |total_cost, order|
      total_cost + order.keys.inject(0) { |cost, key| cost + @menu[key]*order[key] }
    end
  end
end
menu = { rice: 3, noodles: 2 }
order1 = { rice: 1, noodles: 1 }
order2 = { rice: 2, noodles: 2 }
# A restaurant object
restaurant = Restaurant.new(menu)
# Single order
puts restaurant.cost(order1)
# Multiple orders
puts restaurant.cost(order1, order2)

# Array Sum
class MyArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sum(initial_value = 0)
    return array.inject(:+) + initial_value unless block_given?
    sum = initial_value
    array.each {|n| sum += yield(n)}
    sum
  end
end
my_array = MyArray.new([1, 2, 3, 4])
# Case 1: No block, initial value is 0
puts "My array sum with no block provided: #{my_array.sum}"

# Case 2: No block, with initial value
puts "My array sum with no block provided but initial value: #{my_array.sum}"

# Case 3: Block provided
puts "My array sum with a block provided: #{my_array.sum(0) { |n| n ** 2 }}"
