# frozen_string_literal: true

require 'nokogiri'
require 'colorize'
require 'httparty'

# Gets and parses data from web
class Scrap
  attr_reader :url, :response, :parsed, :countries_infected

  def initialize
    @url = 'https://www.worldometers.info/coronavirus/'
    @response = HTTParty.get(url)
    @parsed = Nokogiri::HTML(response)
    class_one = 'table#main_table_countries_today'
    class_two = ' > tbody:not(:last-child) > tr'
    @countries_infected = @parsed.css("#{class_one} #{class_two}")
  end

  def get_validation(arg)
    state = if arg.body.nil? || arg.body.empty?
              false
            elsif !arg.body.nil? || !arg.body.empty?
              true
            else
              false
            end
    state
  end
end
