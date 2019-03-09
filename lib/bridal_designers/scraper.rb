class BridalDesigners::Scraper

  def self.scrape_designers
    page = Nokogiri::HTML(open("https://www.gildedbridal.com/bridal-designers"))
    scraped_designers = page.css(".wpb_wrapper")
  end

  def make_designers
    scrape_designers.each do |d|
      BridalDesigners::Designer.create_from_page(d)
    end
  end
end