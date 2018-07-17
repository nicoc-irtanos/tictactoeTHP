class BoardCase

  attr_accessor :value, :case_number

  def initialize
  end

  def to_s
  end
end

class Board

  include Enumerable

  attr_accessor :cases

  def initialize
    cases = [boardcase_1, boardcase_2, boardcase_3, boardcase_4, boardcase_5, boardcase_6, boardcase_7, boardcase_8, boardcase_9]
  end

  def to_s
  end

  def play
  end

  def victory?
  end
end

class Player

  attr_accessor :name, :value #Noms et valeurs
  attr_writer :state #Victoire ou défaite

  def initialize
    puts "Set your name:"
    name = gets.chomp
  end
end

class Game

  def initialize #Création des joueurs et du plateau
    puts "Welcome to the Tic-Tac-Toe game !"
    @player1 = Player.new
    @player2 = Player.new
    @board = Board.new
  end

  def go #Lancement de la partie
  end

  def turn #Pour passer les tours
  end
end

Game.new.go
