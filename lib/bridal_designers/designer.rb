class BridalDesigners::Designer

  attr_accessor :name, :location, :description, :url

  @@all = []

  def self.scrape_designers
    designers = Array.new
    page = Nokogiri::HTML(open("https://www.gildedbridal.com/bridal-designers"))
    gowns = page.css("div.qode-advanced-tab-container").first
    scraped_designers = gowns.css(".q_elements_item_inner")
    scraped_designers.each do |d|
      designer = {
        name: d.css("h2").text,
        location: d.css("p")[0].text,
        description: d.css("p")[1].text,
        url: d.css("a.gallery-link").attr("href").value
      }
      designers << designer
    end
    designers
  end

  def initialize(designers)
    designers.each {|key, value| self.send(("#{key}="), value)}
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
