class BridalDesigners::Scraper

  def self.scrape_designers
    page = Nokogiri::HTML(open("https://www.gildedbridal.com/bridal-designers"))

    scraped_designers = page.css(".qode-advanced-tab-container .wpb_wrapper")
    scraped_designers.each do |d|
      binding.pry
      BridalDesigners::Designer.create_from_page(d)
    end
  end
end
