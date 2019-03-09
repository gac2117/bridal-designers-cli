class BridalDesigners::Scraper

  def self.scrape_designers
    page = Nokogiri::HTML(open("https://www.gildedbridal.com/bridal-designers"))

    scraped_designers = page.css(".q_elements_item")
    binding.pry
    scraped_designers.each do |d|
      BridalDesigners::Designer.create_from_page(d)
    end
  end
end
