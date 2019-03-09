class BridalDesigners::CLI

  def call
    puts "Are you looking for the perfect wedding dress?"
    puts "Here is a list of bridal designers at Gilded Bridal:"
    list_designers
    choose_designer
  end

  def list_designers
    puts "hello world"
  end

  def choose_designer
    puts "Which designer would you like to know more about? Please choose a number."
    input = gets.strip
    case input
    when "1"
      puts "Designer 1"
    when "2"
      puts "Designer 2"
    end
    closing
  end

  def closing
    puts "Would you like to see another designer? Y / N"
    input = gets.strip.downcase
    case input
    when "y"
      list_designers
      choose_designer
    when "n"
      puts "Good luck with your wedding! Goodbye."
    end
  end
end
