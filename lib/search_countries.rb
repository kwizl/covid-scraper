require 'nokogiri'
require 'colorize'

# Class that searches the details of countries
class Search < List
  def c_data
    super
  end

  def country_details(c_name)
    c_data
    name_array = []
    c_data.each do |country|
      name_array << country[:name].remove_dup
    end

    if name_array.include?(c_name)
      idx = name_array.index(c_name)
      print "#{idx + 1}. Name: #{c_data[idx][:name].remove_dup} ".blue
      print "| New Deaths: #{c_data[idx][:new_deaths]} ".red
      print "| Total Deaths: #{c_data[idx][:total_deaths]} ".red
      print "| Total Recovered: #{c_data[idx][:total_recovered]} ".green
      print "| New Cases: #{c_data[idx][:new_cases]} ".yellow
      print "| Total Cases: #{c_data[idx][:total_cases]}\n".yellow
    else
      puts 'Country is not on list'.red
    end
  end

  def total_cases_max
    c_data
    print "Name: #{c_data[0][:name].remove_dup} ".blue
    print "| Total Cases: #{c_data[0][:total_cases]}\n".yellow
  end

  def total_death_max
    c_data
    print "Name: #{c_data[1][:name].remove_dup} ".blue
    print "| Total Deaths: #{c_data[1][:total_deaths]} ".red
  end
end
