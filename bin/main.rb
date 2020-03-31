#! /usr/bin/env ruby
require 'nokogiri'
require 'colorize'

require_relative '../lib/scrap.rb'
require_relative '../lib/list.rb'
require_relative '../lib/list_countries.rb'
require_relative '../lib/search_countries.rb'

list = List.new
search = Search.new

puts
puts '----------------------------------------
COVID-19 WEB SCRAPER
-------------------------------------------'.blue
puts 'This is a Web Scraper for COVID-19 cases globally.
It pulls data from the web and allows the user view the'.yellow
puts 'new cases, total cases, daily deaths and total deaths
for all countries and individual countries'.yellow

state = true

while state
  puts 'Choose 1 to List All The Country Information'
  puts 'Choose 2 to List Country Name'
  puts 'Choose 3 to Search Individual Country Information'
  puts 'Choose 4 to View Country with Highest Number of Cases'
  puts 'Choose 5 to View Country with Highest Number of Deaths'
  puts 'Choose 6 to View Total Statistics'
  puts 'Choose 0 to Exit'
  print 'Choose: '
  choice = gets.chomp.to_i
  if choice == 1
    puts 'ALL COUNTRIES DATA'
    list.print_all
    state = true
  elsif choice == 2
    list.print_names
    state = true
  elsif choice == 3
    print 'Country Name: '
    choice_name = gets.chomp
    choice_name = choice_name.capitalize
    puts search.country_details(choice_name)
    state = true
  elsif choice == 4
    puts search.total_cases_max
    state = true
  elsif choice == 5
    puts search.total_death_max
    state = true
  elsif choice == 6
    puts list.print_total
    state = true
  elsif choice.zero?
    state = false
    break
  end
  state
end
puts 'Bye!'
