require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
    def initialize
        @doc = Nokogiri::HTML(open("https://www.daftlogic.com/information-appliance-power-consumption.htm"))
    end

    def inspect
        # binding.pry
    end

end

# Scraper.new.inspect