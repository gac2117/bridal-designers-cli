class BridalDesigners::Designer

  attr_accessor :name, :location, :description, :url

  @@all = []

  def scrape_designers
    page = Nokogiri::HTML(open("https://www.gildedbridal.com/bridal-designers"))
    designers = Array.new
    scraped_designers = page.css(".wpb_wrapper")
    scrape_designers.each do |d|
      designer = {
        name: d.search("a.gallery-link").text, # designer name
        location: d.search("p").first.text, # location
        description: d.search("p").text, # description
        url: d.search("a.gallery-link").attr("href").value, # url
      }
      designers << designer
    end
    designers
  end

  def initialize(name=nil, location=nil, description=nil, url=nil)
    @name = name
    @location = location
    @description = description
    @url = url
    @@all << self
  end

  def self.all
    @@all
#  designer_1 = self.new
#  designer_1.name = "Grace"
#  designer_1.location = "Raleigh"
#  designer_1.description = "hello"
#  designer_1.url = "www.hi.com"
#  @@all << designer_1

#  designer_2 = self.new
#  designer_2.name = "Amy"
#  designer_2.location = "Atlanta"
#  designer_2.description = "goodbye"
#  designer_2.url = "www.bye.com"
#  @@all << designer_2
  end
end
