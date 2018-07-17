class BoardCase

  attr_accessor :value, :case_number

  def initialize(value = " ",case_number)
    #TO DO doit régler sa valeur, ainsi que son numéro de case
    @value = value
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
    cases = [boardcase_1, boardcase_2, boardcase_3, boardcase_4, boardcase_5, boardcase_6, boardcase_7, boardcase_8, boardcase_9]
  end

  def to_s
  #TO DO : afficher le plateau

  end

  def play
    #TO DO : une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
  end

  def victory?
    #TO DO : qui gagne ?
  end

class Player
  #TO DO : la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?

  attr_accessor :name, :value #Noms et valeurs
  attr_writer :state #Victoire ou défaite

  def initialize
    puts "Set your name:"
    name = gets.chomp
  end
end

class Game
  def initialize
    #TO DO : créé 2 joueurs, créé un board
    puts "Welcome to the Tic tac toe game !"
    @player1 = Player.new
    @player2 = Player.new
    @board = Board.new
  end

  def go
    # TO DO : lance la partie
  end

  def turn
    #TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie
  end


end

Game.new.go
