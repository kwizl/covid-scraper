require 'nokogiri'
require 'colorize'

# Class that searches the details of countries
class Search < List
  def countries_data
    super
  end

  def country_details(c_name)
    countries_data
    name_array = []
    countries_data.each do |country|
      name_array << country[:name].remove_dup
    end

    if name_array.include?(c_name)
      idx = name_array.index(c_name)
      print "#{idx + 1}. Name: #{countries_data[idx][:name].remove_dup} ".blue
      print "| New Deaths: #{countries_data[idx][:new_deaths]} ".red
      print "| Total Deaths: #{countries_data[idx][:total_deaths]} ".red
      print "| Total Recovered: #{countries_data[idx][:total_recovered]} ".green
      print "| New Cases: #{countries_data[idx][:new_cases]} ".yellow
      print "| Total Cases: #{countries_data[idx][:total_cases]}\n".yellow
    else
      puts 'Country is not on list'.red
    end
  end

  def total_cases_max
    countries_data
    print "Name: #{countries_data[0][:name].remove_dup} ".blue
    print "| Total Cases: #{countries_data[0][:total_cases]}\n".yellow
  end

  def total_death_max
    countries_data
    print "Name: #{countries_data[1][:name].remove_dup} ".blue
    print "| Total Deaths: #{countries_data[1][:total_deaths]} ".red
  end
end
