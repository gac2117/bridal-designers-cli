class BridalDesigners::Designer

  attr_accessor :name, :location, :description, :url

  @@all = []

  def self.create_from_page(d)
    self.new(
      d.css("h2").text, # designer name
      d.css("p").text, # location
      d.css("p").text, # description
      d.css('a')[0].attributes["href"].value, # url
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
  end
end
