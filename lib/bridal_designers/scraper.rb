class BridalDesigners::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.gildedbridal.com/bridal-designers"))
  end

  def scrape_designers
    self.get_page.css(".wpb_wrapper")
  end

  def make_designers
    scrape_designers.each do |d|
      BridalDesigners::Designer.create_from_page(d)
    end
  end
end
