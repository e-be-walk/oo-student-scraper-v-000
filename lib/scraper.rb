require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  #method takes argument of URL using nokogiri and open-uri, return hash
  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    student_index_array = []
    student = {}

    #hash to include name, location, and profile_url
    doc.css("div.roster-cards-container").each do |profile|
      profile.css('.student-card a').each do |student|
        student = {
        :name => student.css('.student-name').text,
        :location => student.css('.student-location').text,
        :url => student.attr('href')
      }
      student_index_array << student
      binding.pry
    end
    #binding.pry
    student_index_array
  end
end
  #method takes argument of URL using nokogiri and open-uri, return hash
  def self.scrape_profile_page(profile_url)
    #doc = Nokogiri::HTML(open(index_url))
    #hash to include twitter, linkedin, github, blog, profile_quote, and bio
    #include defaults just in case profile doesn't contain one

  end

end
