require 'nokogiri'
require 'colorize'

require_relative './scrap.rb'
require_relative './list.rb'
include Listing

class List < Scrap
  def initialize
    @scrap = Scrap.new
  end

  def get_validation(arg)
    super
  end

  def countries_data
    count = 0
    countries_array = []
    if get_validation(@scrap.response)
      @scrap.countries_infected.each do |countries|
        countries.each do
          count += 1
          country = {
            name: countries.css(':first-child').text,
            new_deaths: countries.css(':nth-child(5)').text,
            total_deaths: countries.css(':nth-child(4)').text,
            total_recovered: countries.css(':nth-child(6)').text,
            new_cases: countries.css(':nth-child(3)').text,
            total_cases: countries.css(':nth-child(2)').text
          }
          countries_array << country
        end
      end
    else
      print 'No Content!'
    end
    countries_array
  end

  def print_dash
    125.times do
      print '-'
    end
    puts
  end

  def print_all
    count = 0
    if get_validation(@scrap.response)
      countries_data.each do |country|
        count += 1
        print "#{count}. Name: #{country[:name].remove_dup} ".blue
        print "| New Deaths: #{country[:new_deaths]} ".red
        print "| Total Deaths: #{country[:total_deaths]} ".red
        print "| Total Recovered: #{country[:total_recovered]} ".green
        print "| New Cases: #{country[:new_cases]} ".yellow
        print "| Total Cases: #{country[:total_cases]}\n".yellow
        print_dash
      end
    else
      print 'No Content!'
    end
  end

  def print_names
    count = 0
    if get_validation(@scrap.response)
      countries_data.each do |country|
        count += 1
        print "#{count}.#{country[:name].remove_dup}, ".blue
      end
      puts
    else
      print 'No Content!'
    end
  end

  def print_total
    countries_d = []
    class_one = 'table#main_table_countries_today'
    class_two = ' > tbody:last-child > tr'
    countries_infected = @scrap.parsed.css("#{class_one} #{class_two}")
    countries_infected.each do |countries|
      countries.each do
        country = {
          name: countries.css(':first-child').text,
          new_deaths: countries.css(':nth-child(5)').text,
          total_deaths: countries.css(':nth-child(4)').text,
          total_recovered: countries.css(':nth-child(6)').text,
          new_cases: countries.css(':nth-child(3)').text,
          total_cases: countries.css(':nth-child(2)').text
        }
        countries_d << country
      end
    end
    print "#{countries_d[-1][:name].remove_dup} ".blue
    print "| New Deaths: #{countries_d[-1][:new_deaths]} ".red
    print "| Total Deaths: #{countries_d[-1][:total_deaths]} ".red
    print "| Total Recovered: #{countries_d[-1][:total_recovered]} ".green
    print "| New Cases: #{countries_d[-1][:new_cases]} ".yellow
    print "| Total Cases: #{countries_d[-1][:total_cases]}\n".yellow
  end
end
