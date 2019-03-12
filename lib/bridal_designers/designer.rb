class BridalDesigners::Designer

  attr_accessor :name, :location, :description, :url

  @@all = []

  def self.scrape_designers
    designers = Array.new
    page = Nokogiri::HTML(open("https://www.gildedbridal.com/bridal-designers"))
    gowns = page.css("div.qode-advanced-tab-container").first
    scraped_designers = gowns.css("div.wpb_text_column")
    scraped_designers.each do |d|
      designer = {}
      designer[:name] = d.css("h2").text
      if d.search('p').empty?
        designer[:location] = d.css(".wpb_wrapper").first.css('div')[0].text
        designer[:description] = d.css(".wpb_wrapper").first.css('div')[2].text
      else
        designer[:location] = d.css("p")[0].text
        designer[:description] = d.css('p')[1].text
      end
      designer[:url] = d.css('h2.gallery-title a').map { |e| e.attribute('href').value}
      designers << designer
    end
    designers
  end

  def self.create_from_array
    designers_hash = self.scrape_designers
    designers_hash.each do |d|
      BridalDesigners::Designer.new(d)
    end
  end

  def initialize(d)
    d.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.all
    @@all
  end

end
