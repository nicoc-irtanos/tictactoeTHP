class BoardCase

  attr_accessor :value, :case_number

  def initialize(case_number)
    #TO DO doit régler sa valeur, ainsi que son numéro de case
    @value = case_number
    @case_number = case_number
  end

  def to_s
    #TO DO : doit renvoyer la valeur au format string
    value.to_s
  end

end

class Board

  include Enumerable
  #TO DO : la classe a 1 attr_accessor, une array qui contient les BoardCases

  attr_accessor :cases

  def initialize
    @boardcase_1 = BoardCase.new(1)
    @boardcase_2 = BoardCase.new(2)
    @boardcase_3 = BoardCase.new(3)
    @boardcase_4 = BoardCase.new(4)
    @boardcase_5 = BoardCase.new(5)
    @boardcase_6 = BoardCase.new(6)
    @boardcase_7 = BoardCase.new(7)
    @boardcase_8 = BoardCase.new(8)
    @boardcase_9 = BoardCase.new(9)
    @cases = [[@boardcase_1, @boardcase_2, @boardcase_3], [@boardcase_4, @boardcase_5, @boardcase_6], [@boardcase_7, @boardcase_8, @boardcase_9]]
  end

  def to_s
    #TO DO : afficher le plateau
    @cases.each do |board|
      board = board.to_s
    end
    puts @cases[0].join("|")
    puts @cases[1].join("|")
    puts @cases[2].join("|")
  end

  def play(num)
    #TO DO : une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
    @cases.flatten(num-1).value = @player1.value
  end

  def victory?
    #TO DO : qui gagne ?
    if truc 
      player1
    end

  end
end

class Player
  #TO DO : la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?

  attr_accessor :name, :value #Noms et valeurs
  attr_writer :state #Victoire ou défaite

  def initialize(value)
    puts "Set your name:"
    @name = gets.chomp
    @value = value
    @state = ""
  end
end

class Game
  def initialize
    #TO DO : créé 2 joueurs, créé un board
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @board = Board.new
  end

  def go
    # TO DO : lance la partie
    puts "Welcome to the Tic tac toe game !"
    @board.to_s
    turn
  end

  def turn
    #TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie

    #if board.victory?

    #else
      #switch les joueurs
      @player1, @player2 = @player2, @player1
      puts @player1.value
    puts "tour de :" + @player1.name.to_s
    puts "choisisez une case"
    @board.play(gets.chomp.to_i)
    @board.to_s

    
  end

end

Game.new.go
