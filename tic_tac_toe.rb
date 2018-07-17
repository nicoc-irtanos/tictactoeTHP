class BoardCase
  attr_accessor :value, :case_number

  def initialize(case_number)
    # TO DO doit régler sa valeur, ainsi que son numéro de case
    @value = case_number
    @case_number = case_number
  end

  def to_s
    # TO DO : doit renvoyer la valeur au format string
    value.to_s
  end
end

class Board
  include Enumerable
  # TO DO : la classe a 1 attr_accessor, une array qui contient les BoardCases

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
    # TO DO : afficher le plateau
    @cases.each do |board|
      board = board.to_s
    end
    puts @cases[0].join("|")
    puts @cases[1].join("|")
    puts @cases[2].join("|")
  end

  def victory?(player1, player2)
    #à partir du tableau de tableau (qui n'a servi à rien au final), on le flatten
    #puis comme c'est un tableau de boardman
    #on .map value
    #pour qu'il devienne un tableau de value
    #càd un tableau de string ou de integer
    tablo = @cases.flatten.map(&:value)
    #on vérifie si le tableau est composé entièrement de string
    #càd c'est un draw
    if tablo.all?(String)
      puts "draw mfw"
      player1.state = "draw"
      player2.state = "draw"
    end
    win_combos = [[@boardcase_1, @boardcase_2, @boardcase_3],
                  [@boardcase_1, @boardcase_4, @boardcase_7],
                  [@boardcase_1, @boardcase_5, @boardcase_9],
                  [@boardcase_4, @boardcase_5, @boardcase_6],
                  [@boardcase_7, @boardcase_8, @boardcase_9],
                  [@boardcase_3, @boardcase_5, @boardcase_7],
                  [@boardcase_2, @boardcase_5, @boardcase_8],
                  [@boardcase_3, @boardcase_6, @boardcase_9]]

    win_combos.each do |combos|
      if combos[0].to_s == player1.value && combos[1].to_s == player1.value && combos[2].to_s == player1.value
        player1.state = "win"
        puts player1.name + " " + "won"

      elsif combos[0].to_s == player2.value && combos[1].to_s == player2.value && combos[2].to_s == player2.value
        puts player2.name + " " + "won"
        player2.state = "win"
      end
    end
  end

  def play(player, num)
    # TO DO : une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
    if @cases.flatten[num - 1].value == "O"
      puts "invalid move, player change"
    elsif @cases.flatten[num - 1].value == "X"
      puts "invalid move, player change"
    else @cases.flatten[num - 1].value = player.value
    end
  end
end

class Player
  # TO DO : la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?

  attr_accessor :name, :value # Noms et valeurs
  attr_accessor :state # Victoire ou défaite

  def initialize(value)
    puts "Set your name:"
    @name = gets.chomp
    @name = name
    @value = value
    @state = ""
  end
end

class Game
  def initialize
    # TO DO : créé 2 joueurs, créé un board
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
    # TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie
    while (@player1.state == "") && (@player2.state = "")
      puts @player1.name.to_s + "'s turn"
      puts "choose a case"
      @board.play(@player1, gets.chomp.to_i)
      @board.to_s
      # switch les joueurs
      @board.victory?(@player1, @player2)
      @player1, @player2 = @player2, @player1
    end
  end
end

Game.new.go
