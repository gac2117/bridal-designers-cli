class BridalDesigners::CLI

  def call
    BridalDesigners::Designer.scrape_designers
    BridalDesigners::Designer.create_from_array
    puts "Are you looking for the perfect wedding dress?"
    list_designers
    choose_designer
  end

  def list_designers
    puts "Here is a list of bridal designers at Gilded Bridal:"
    designers = BridalDesigners::Designer.all
    designers.each.with_index(1) do |designer, i|
      puts "#{i}. #{designer.name}"
    end
  end

  def choose_designer
    puts "Which designer would you like to know more about? Please choose a number."
    input = gets.strip.downcase
    if input.to_i == 0
      puts "Please choose from among one of the listed designers."
    elsif input.to_i > 15
      puts "Please choose from among one of the listed designers."
    else
      the_designer = BridalDesigners::Designer.all[input.to_i-1]
      puts "Designer: #{the_designer.name} from #{the_designer.location}!"
      puts "Description: #{the_designer.description}"
      if the_designer.url.nil?
        puts "There is no website available for this designer."
      else
        puts "For more information, go to #{the_designer.url}."
      end
    end
    closing
  end

  def closing
    puts "Would you like to see the list of designers again? Y / N"
    input = gets.strip.downcase
    if input == "y"
      list_designers
      choose_designer
    elsif input == "n"
      puts "Good luck with your wedding! Goodbye."
    else
      puts "Please enter Y or N"
      closing
    end
  end
end
