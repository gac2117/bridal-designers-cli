class BridalDesigners::Designer

  attr_accessor :name, :location, :description, :url

  @@all = []

  def self.scrape_designers
    page = Nokogiri::HTML(open("https://www.gildedbridal.com/bridal-designers"))
    scraped_designers = page.css(".qode-advanced-tab-container").first
    scraped_designers.each do |d|
      details = d.css("p")
      designer = {
        name: d.css("h2").text,
        location: d.css("p")[0].text,
        description: d.css("p")[1].text,
        url: d.css("a.gallery-link").attr("href").value
      }
    end
  end

  def self.create_from_page(d)
    self.new(
      d.search("h2").text, # designer name
      d.search("p").text, # location
      d.search("p").text, # description
      d.search("a.gallery-link").attr("href").value, # url
    )
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
