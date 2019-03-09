class BridalDesigners::CLI

  def call
    puts "Are you looking for the perfect wedding dress?"
    list_designers
    choose_designer
  end

  def list_designers
    puts "Here is a list of bridal designers at Gilded Bridal:"
    @designers = BridalDesigners::Designer.all
    @designers.each.with_index(1) do |designer, i|
      puts "#{i}. #{designer.name}"
    end
  end

  def choose_designer
    puts "Which designer would you like to know more about? Please choose a number."
    input = gets.strip.downcase
    if input.to_i > 0
      the_designer = @designers[input.to_i-1]
      puts "#{the_designer.name} from #{the_designer.location}. #{the_designer.description}. For more information, go to #{the_designer.url}."
    else
      puts "Please choose from among one of the listed designers."
    end
    closing
  end

  def closing
    puts "Would you like to see the list of designers again? Y / N"
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
