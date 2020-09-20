require_relative 'score'

class Game

  attr_reader :p1, :p2, :p1_selection, :comp_selection, :p1_score, :p2_score

  OPTION = ["rock", "spock" , "paper", "lizard", "scissors"]

  def initialize(p1, p2 = "Computer", scores = Score.create)
    @p1 = p1
    @p2 = p2
    @p1_score, @p2_score = scores
  end

  def self.create(p1, p2)
    @game = Game.new(p1, p2)
  end

  def self.instance
    @game
  end

  def p1_choice(selection)
    @p1_selection = selection
  end

  def randomiser
    @comp_selection = OPTION.sample
  end

  def compare
    @result = (convert(@p1_selection)) - (convert(@comp_selection))
  end

  def message
    case @result % 5
    when 1,2
      'You win'
    when 3,4
      "You lose"
    when 0
      "It's a tie"
    end
  end 
  
  private
  
  def convert(option)
    OPTION.find_index(option) + 1
  end 

end
