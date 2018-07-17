require_relative "./Player.rb"
require_relative "./Boardcase.rb"
require_relative "./Board.rb"
class Game
  def initialize #Création des players et du board. On assigne la lettre directement aux joueurs
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @board = Board.new
  end

  def go #Lance la partie et affiche le board, appelle la méthode turn pour que les joueurs puissent commencer à jouer
    puts "Welcome to the Tic tac toe game !"
    @board.to_s
    turn
  end

  def turn
    while (@player1.state == "") && (@player2.state = "")
      puts @player1.name.to_s + "'s turn: " + @player1.value
      puts "choose a case"
      @board.play(@player1, gets.chomp.to_i) #la méthode play a besoin des arguments
      @board.to_s
      @board.victory?(@player1, @player2) #Check si il y a une victoire, la méthode victory casse le while si oui en changeant le state
      @player1, @player2 = @player2, @player1 # switch les joueurs
    end
  end
end

Game.new.go
