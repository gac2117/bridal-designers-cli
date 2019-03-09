class BridalDesigners::Designer

  attr_accessor :name, :location, :description, :url

  @@all = []

  def self.create_from_page(d)
    self.new(
      d.search("a.gallery-link").text, # designer name
      d.search("p").first.text, # location
      d.search("p").text, # description
      d.search("a.gallery-link").attr("href").value, # url
    )
  end

#  def initialize(name=nil, location=nil, description=nil, url=nil)
#    @name = name
#    @location = location
#    @description = description
#    @url = url
#    @@all << self
#  end

  def self.all
#    @@all
  designer_1 = self.new
  designer_1.name = "Grace"
  designer_1.location = "Raleigh"
  designer_1.description = "hello"
  designer_1.url = "www.hi.com"
  @@all << designer_1

  designer_2 = self.new
  designer_2.name = "Amy"
  designer_2.location = "Atlanta"
  designer_2.description = "goodbye"
  designer_2.url = "www.bye.com"
  @@all << designer_2
  end
end
