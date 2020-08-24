require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
    def initialize
        @doc = Nokogiri::HTML(open("https://www.daftlogic.com/information-appliance-power-consumption.htm"))
    end

    def options
        @doc.css("tbody tr").each do |row|
            Option.create(
                name: row.css("td")[0].text,
                power: row.css("td")[2].text.gsub(/[a-zA-Z]/, "").to_f,
                standby: row.css("td")[3].text.gsub(/[a-zA-Z]/, "").to_f
            )
        end
    end

end