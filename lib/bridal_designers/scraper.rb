class BridalDesigners::Scraper

  def self.scrape_designers
    page = Nokogiri::HTML(open("https://www.gildedbridal.com/bridal-designers"))
    gowns = page.css("div.qode-advanced-tab-container").first
    scraped_designers = gowns.css(".q_elements_item_inner")
    scraped_designers.each do |d|
      binding.pry
      BridalDesigners::Designer.create_from_page(d)
    end
  end
end
