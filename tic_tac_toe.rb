class BoardCase
  attr_accessor :value, :case_number

  def initialize(case_number) #associe chaque case à son nombre (voir plus bas)
    @value = case_number
    @case_number = case_number
  end

  def to_s #Mise en place des value
    value.to_s
  end
end

class Board
  include Enumerable

  attr_accessor :cases

  def initialize #Définition des instances et regroupement dans une array
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

  def to_s #mise en String
    @cases.each do |board|
      board = board.to_s
    end
    puts @cases[0].join("|") #affichage du board
    puts @cases[1].join("|")
    puts @cases[2].join("|")
  end

  def victory?(player1, player2)
    win_combos = [[@boardcase_1, @boardcase_2, @boardcase_3], #Array des combinaisons gagnantes
                  [@boardcase_1, @boardcase_4, @boardcase_7],
                  [@boardcase_1, @boardcase_5, @boardcase_9],
                  [@boardcase_4, @boardcase_5, @boardcase_6],
                  [@boardcase_7, @boardcase_8, @boardcase_9],
                  [@boardcase_3, @boardcase_5, @boardcase_7],
                  [@boardcase_2, @boardcase_5, @boardcase_8],
                  [@boardcase_3, @boardcase_6, @boardcase_9]]

    win_combos.each do |combos| #Boucle de vérification de condition de victoire
      if combos[0].to_s == player1.value && combos[1].to_s == player1.value && combos[2].to_s == player1.value
        player1.state = "win"
        puts player1.name + " " + "won"

      elsif combos[0].to_s == player2.value && combos[1].to_s == player2.value && combos[2].to_s == player2.value
        puts player2.name + " " + "won"
        player2.state = "win"
      end
    end
    #à partir du tableau de tableau (qui n'a servi à rien au final), on le flatten
    #puis comme c'est un tableau de boardman
    #on .map value
    #pour qu'il devienne un tableau de value
    #càd un tableau de string ou de integer
    tablo = @cases.flatten.map(&:value)
    #on vérifie si le tableau est composé entièrement de string
    #càd c'est un draw
    #unless il y a déjà un win
    #unless (player1.state = "win" || player2.state = "win")
      if tablo.all?(String) 
        puts "draw mfw"
        player1.state = "draw"
        player2.state = "draw"
      end
    #end  
  end

  def play(player, num) #Changement des numéros initiaux en O ou X. Si l'input n'est pas un numéro, on passe le tour. Tolérance 0 !
    if @cases.flatten.fetch(num - 1,"non").value == "O"
      puts "invalid move, player change"
    elsif @cases.flatten.fetch(num - 1,"non").value == "X"
      puts "invalid move, player change"
    else @cases.flatten.fetch(num - 1,"non").value = player.value
    end
  end
end

class Player
  attr_accessor :name, :value # Noms et valeurs
  attr_accessor :state # Victoire ou défaite

  def initialize(value) #Laisse les joueurs mettre leurs noms, le state est vide au début, la value est imposée (voir plus bas)
    puts "Set your name:"
    @name = gets.chomp
    @name = name
    @value = value
    @state = ""
  end
end

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
