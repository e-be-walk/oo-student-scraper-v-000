require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  #method takes argument of URL using nokogiri and open-uri, return hash
  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students = []

    #hash to include name, location, and profile_url
    doc.css("div.roster-cards-container").each do |profile|
      profile.css('.student-card a').each do |student|
        name = student.css('.student-name').text,
        location = student.css('.student-location').text,
        url = student.attr('href')
        students << {name: name, location: location, profile_url: url}
      binding.pry
    end
  end
end
  #method takes argument of URL using nokogiri and open-uri, return hash
  def self.scrape_profile_page(profile_url)
    #doc = Nokogiri::HTML(open(index_url))
    #hash to include twitter, linkedin, github, blog, profile_quote, and bio
    #include defaults just in case profile doesn't contain one

  end

end
